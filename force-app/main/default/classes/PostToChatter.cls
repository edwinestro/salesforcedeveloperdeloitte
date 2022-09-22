public with sharing class PostToChatter implements Schedulable{
    public void execute(SchedulableContext ctx) {

        FeedItem objPost = new FeedItem();
        objPost.ParentId = UserInfo.getUserId();
    objPost.Body = 'Producto sin Inventario';
    insert objPost;
    
    }
}