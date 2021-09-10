package com.workflow.process.center.aspect;


import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.workflow.process.center.common.ResultBean;
import com.workflow.process.center.exception.BizException;
import com.fasterxml.jackson.core.JsonParseException;
import lombok.extern.slf4j.Slf4j;
import org.flowable.common.engine.api.FlowableException;
import org.flowable.common.engine.api.FlowableTaskAlreadyClaimedException;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.mail.MailException;
import org.springframework.validation.BindException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.websocket.DecodeException;
import java.sql.SQLException;

/**
 * 统一异常处理
 */
@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public ResultBean<Object> exceptionHandler(Throwable e) {

        return doGlobalExceptionHandler(e);
    }

    /**
     * 执行异常处理
     *
     * @param e
     * @return
     */
    public static ResultBean<Object> doGlobalExceptionHandler(Throwable e) {

        log.error(e.getMessage(), e);

        if (e instanceof BizException) {
            String code = ((BizException) e).getCode();
            String msg = ((BizException) e).getMsg();
            if (null == code) {
                return ResultBean.ofError(msg);
            } else {
                return ResultBean.ofError(code, msg);
            }
        }else if (e instanceof HttpRequestMethodNotSupportedException) {
                return ResultBean.ofError("请检查请求方法类型是否正确！");
        } else if (e instanceof FlowableException) {
            //FlowableException
            if (e instanceof FlowableTaskAlreadyClaimedException){
                return ResultBean.ofError("任务"+((FlowableTaskAlreadyClaimedException) e).getTaskId()+"已经被领取！");
            }else {
                return ResultBean.ofError("流程引擎异常："+ e.getMessage());
            }
        } else if (e instanceof MissingServletRequestParameterException) {
            String parameterName = ((MissingServletRequestParameterException) e).getParameterName();
            return ResultBean.ofError(parameterName + "不能为空");
        }  else if (e instanceof BindException ) {
            return ResultBean.ofError(((BindException)e).getBindingResult().getFieldError().getDefaultMessage());
        }else if (e instanceof MethodArgumentNotValidException) {
            return ResultBean.ofError("表单必录数据填写不完整");
        } else if (e instanceof DecodeException) {
            return ResultBean.ofError(e.getMessage());
        }  else if (e instanceof IllegalArgumentException) {
            return ResultBean.ofError(e.getMessage());
        } else if (e instanceof NullPointerException) {
            return ResultBean.ofError(e.getMessage());
        } else if (e instanceof MailException) {
            return ResultBean.ofError("邮件发送失败");
        } else if (e instanceof JsonParseException) {
            return ResultBean.ofError("参数类型转换异常");
        } else if (e instanceof BadSqlGrammarException) {
            return ResultBean.ofError("出错啦,请稍后再试!");
        } else if (e instanceof SQLException) {
            return ResultBean.ofError("出错啦,请稍后再试!");
        } else if (e instanceof RuntimeException) {
            return ResultBean.ofError("出错啦,请稍后再试!");
        } else if (e instanceof Exception) {
            return ResultBean.ofError("出错啦,请稍后再试!");
        } else {
            String errorMsg = e.toString() == null ? e.getMessage() : e.toString();
            return ResultBean.ofError(StringUtils.isBlank(errorMsg) ? "未知错误" : errorMsg);
        }
    }

}
