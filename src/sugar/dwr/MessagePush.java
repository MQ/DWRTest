package sugar.dwr;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.directwebremoting.Browser;
import org.directwebremoting.ScriptBuffer;
import org.directwebremoting.ScriptSession;

public class MessagePush {

        public void send(final String content){
        		System.out.println(content);
              Runnable run = new Runnable(){
                      private ScriptBuffer script = new ScriptBuffer();
                      public void run() {
                            //设置要调用的 js及参数
                            script.appendCall("show" , content);
                            Map<String, Object> map =new HashMap<String, Object>();
                            map.put("12", new Date());
                            map.put("23","{'name':'lisi'}");
                            script.appendCall("showDate" , map);
                            //得到所有ScriptSession
                           Collection<ScriptSession> sessions = Browser.getTargetSessions();
                            //遍历每一个ScriptSession
                            for (ScriptSession scriptSession : sessions){
                                  scriptSession.addScript(script);
                           }
                     }
              };
               //执行推送
              Browser. withAllSessions(run);
       }
}