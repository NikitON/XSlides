package com.team.xslides.dao;

import java.io.IOException;

import java.util.List;

import com.team.xslides.domain.Presentation;
import com.team.xslides.domain.Template;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.LockObtainFailedException;
import org.apache.lucene.store.RAMDirectory;
import org.apache.lucene.util.Version;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PresentationDAOImpl implements PresentationDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void addPresentation(Presentation presentation) {
        getSession().saveOrUpdate(presentation);
    }

    public void removePresentation(Integer id) {
        Presentation presentation = getPresentationById(id);
        if (null != presentation) {
            getSession().delete(presentation);
        }
    }

    public String getContent(Integer id) {
        return getPresentationById(id).getContent();
    }

    public Presentation getPresentation(Integer id) {
        Presentation presentation = (Presentation) getSession()
                        .createQuery("from Presentation where id='" + id.toString() + "'").list().get(0);
        return presentation;
    }

    public String getPresentationJson(Integer id) {
        return getPresentationById(id).getJson();
    }

    @SuppressWarnings("unchecked")
    public List<Presentation> getPresentationsList() {
        return getSession().createQuery("from Presentation").list();
    }

    private static final int HITS_NUMBER = 20;

    public List<Presentation> getPresentationForQuery(String searchQuery) {
        try {
            List<Presentation> presentations = getPresentationsList();
            StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_36);
            Directory index = new RAMDirectory();
            writeIndexes(presentations, index, analyzer);
            QueryParser queryParser = new QueryParser(Version.LUCENE_36, "content", analyzer);
            IndexSearcher searcher = new IndexSearcher(IndexReader.open(index));
            TopScoreDocCollector collector = TopScoreDocCollector.create(HITS_NUMBER, true);
            searcher.search(queryParser.parse("title:" + searchQuery + " OR theme:" + searchQuery + " OR description:"
                            + searchQuery + " OR content:" + searchQuery), collector);
            ScoreDoc[] hits = collector.topDocs().scoreDocs;
            return getResultList(presentations, searcher, hits);
        } catch (Exception exception) {
            return null;
        }
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    private void addDoc(IndexWriter writer, Presentation presentation) throws IOException {
        Document doc = new Document();
        doc.add(new Field("title", presentation.getTitle(), Field.Store.NO, Field.Index.ANALYZED));
        doc.add(new Field("theme", presentation.getTheme(), Field.Store.NO, Field.Index.ANALYZED));
        doc.add(new Field("description", presentation.getDescription(), Field.Store.NO, Field.Index.ANALYZED));
        doc.add(new Field("content", presentation.getContent(), Field.Store.NO, Field.Index.ANALYZED));
        doc.add(new Field("id", presentation.getId().toString(), Field.Store.YES, Field.Index.NO));
        writer.addDocument(doc);
    }

    private void writeIndexes(List<Presentation> presentations, Directory index, StandardAnalyzer analyzer)
                    throws LockObtainFailedException, CorruptIndexException, IOException {
        IndexWriter writer = new IndexWriter(index, new IndexWriterConfig(Version.LUCENE_36, analyzer));
        for (Presentation presentation : presentations) {
            addDoc(writer, presentation);
        }
        writer.close();
    }

    @SuppressWarnings("unchecked")
    private List<Presentation> getResultList(List<Presentation> presentations, IndexSearcher searcher, ScoreDoc[] hits)
                    throws IOException {
        if (hits.length == 0) {
            searcher.close();
            return null;
        } else {
            StringBuilder query = new StringBuilder("from Presentation where id in("
                            + searcher.doc(hits[0].doc).get("id"));
            for (int i = 1; i < hits.length; i++) {
                query.append("," + searcher.doc(hits[i].doc).get("id"));
            }
            query.append(")");
            searcher.close();
            return getSession().createQuery(query.toString()).list();
        }
    }

    private Presentation getPresentationById(Integer id) {
        return (Presentation) getSession().load(Presentation.class, id);
    }

    public void setNewTitle(Integer id, String title) {
        Presentation presentation = getPresentationById(id);
        presentation.setTitle(title);
        getSession().saveOrUpdate(presentation);
    }

    public void setNewTheme(Integer id, String theme) {
        Presentation presentation = getPresentationById(id);
        presentation.setTheme(theme);
        getSession().saveOrUpdate(presentation);
    }

    public void setNewDescription(Integer id, String description) {
        Presentation presentation = getPresentationById(id);
        presentation.setDescription(description);
        getSession().saveOrUpdate(presentation);
    }
    
    public String getTemplate(Integer presentationID)
    {
	Presentation presentation = getPresentationById(presentationID);
	return presentation.getTemplate().getContent();
    }
    
    public void setTemplate(Integer presentationID, Integer templateID)
    {
	Presentation presentation = getPresentationById(presentationID);
	Template template = (Template)sessionFactory.getCurrentSession().load(Template.class, templateID);
	presentation.setTemplate(template);
    }
    
}
