import ceylonfx.application {
    CeylonFxAdapter,
    CeylonNode,
    asNodes
}
import ceylonfx.geometry {
    Dimension
}
import ceylonfx.scene.paint {
    Paint,
    white
}

import javafx.scene {
    Node,
    JScene=Scene,
    Group
}

shared class Scene(
    Dimension dimension = [600.0, 400.0],
    Paint fill = white,
    Boolean depthBuffer = false,
    {Node|CeylonNode*} children = [])
        extends CeylonFxAdapter<JScene>() {
    
    late JScene jscene;
    
    shared actual JScene createDelegate() {
        Group root = Group();
        root.children.setAll(*asNodes(children));
        jscene = JScene(root, dimension[0], dimension[1], depthBuffer);
        jscene.fill = fill.delegate;
        return jscene;
    }
    
    shared Cursor cursor => Cursor(jscene.cursor);
    assign cursor => jscene.cursor=cursor.cursor;
    
}
