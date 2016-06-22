<%@ page contentType="text/plain" %>
<%@ page import="info.magnolia.importexport.BootstrapUtil"%>
<%@ page import="info.magnolia.context.*"%>
<%@ page import="info.magnolia.cms.util.ContentUtil"%>
<%@ page import="info.magnolia.cms.core.HierarchyManager"%>
<%@ page import="javax.jcr.Node"%>
<%@ page import="javax.jcr.ImportUUIDBehavior"%>
<%
info.magnolia.context.MgnlContext.setInstance(new info.magnolia.context.SingleJCRSessionSystemContext());
try{
  BootstrapUtil.bootstrap(new String[]{"/mgnl-bootstrap/core/users.system.superuser.xml"},
    ImportUUIDBehavior.IMPORT_UUID_COLLISION_REMOVE_EXISTING);
  HierarchyManager hm = MgnlContext.getHierarchyManager("users");
  hm.save();
  } catch (Exception e) {
  System.out.println(e);
  }
  System.out.println("finished");
%>
