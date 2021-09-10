package com.workflow.process.center.config.flowable.canvas;

import org.flowable.bpmn.model.AssociationDirection;
import org.flowable.bpmn.model.GraphicInfo;
import org.flowable.image.impl.DefaultProcessDiagramCanvas;
import org.flowable.image.util.ReflectUtil;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.font.LineBreakMeasurer;
import java.awt.font.TextAttribute;
import java.awt.font.TextLayout;
import java.awt.geom.Ellipse2D;
import java.awt.geom.Line2D;
import java.awt.geom.Rectangle2D;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.text.AttributedCharacterIterator;
import java.text.AttributedString;

/**
*   @Author: 土豆仙
*   @Date: 2021/6/25 22:53
*   @Description: 重写绘图
*/
public class MyProcessDiagramCanvas extends DefaultProcessDiagramCanvas {
    //定义走过流程连线颜色为绿色
    protected static Color HIGHLIGHT_SequenceFlow_COLOR = Color.GREEN;
    //设置未走过流程的连接线颜色
    protected static Color CONNECTION_COLOR = Color.BLACK;
    //设置flows连接线字体颜色red
    protected static Color LABEL_COLOR = new Color(0, 0, 0);
    //高亮显示task框颜色
    protected static Color HIGHLIGHT_COLOR = Color.GREEN;
    protected static Color HIGHLIGHT_COLOR1 = Color.RED;

    public MyProcessDiagramCanvas(int width, int height, int minX, int minY, String imageType, String activityFontName, String labelFontName, String annotationFontName, ClassLoader customClassLoader) {
        super(width, height, minX, minY, imageType, activityFontName, labelFontName, annotationFontName, customClassLoader);
        this.initialize(imageType);
    }

    /**
     * 重写绘制连线的方式,设置绘制颜色
     * @param xPoints
     * @param yPoints
     * @param conditional
     * @param isDefault
     * @param connectionType
     * @param associationDirection
     * @param highLighted
     * @param scaleFactor
     */
    @Override
    public void drawConnection(int[] xPoints, int[] yPoints, boolean conditional, boolean isDefault, String connectionType, AssociationDirection associationDirection, boolean highLighted, double scaleFactor) {
        Paint originalPaint = this.g.getPaint();
        Stroke originalStroke = this.g.getStroke();
        this.g.setPaint(CONNECTION_COLOR);
        if (connectionType.equals("association")) {
            this.g.setStroke(ASSOCIATION_STROKE);
        } else if (highLighted) {
            this.g.setPaint(HIGHLIGHT_SequenceFlow_COLOR);
            this.g.setStroke(HIGHLIGHT_FLOW_STROKE);
        }

        for (int i = 1; i < xPoints.length; ++i) {
            Integer sourceX = xPoints[i - 1];
            Integer sourceY = yPoints[i - 1];
            Integer targetX = xPoints[i];
            Integer targetY = yPoints[i];
            java.awt.geom.Line2D.Double line = new java.awt.geom.Line2D.Double((double) sourceX, (double) sourceY, (double) targetX, (double) targetY);
            this.g.draw(line);
        }

        if (isDefault) {
            Line2D.Double  line = new Line2D.Double((double) xPoints[0], (double) yPoints[0], (double) xPoints[1], (double) yPoints[1]);
            this.drawDefaultSequenceFlowIndicator(line, scaleFactor);
        }

        if (conditional) {
            Line2D.Double line = new java.awt.geom.Line2D.Double((double) xPoints[0], (double) yPoints[0], (double) xPoints[1], (double) yPoints[1]);
            this.drawConditionalSequenceFlowIndicator(line, scaleFactor);
        }

        if (associationDirection.equals(AssociationDirection.ONE) || associationDirection.equals(AssociationDirection.BOTH)) {
            Line2D.Double line = new java.awt.geom.Line2D.Double((double) xPoints[xPoints.length - 2], (double) yPoints[xPoints.length - 2], (double) xPoints[xPoints.length - 1], (double) yPoints[xPoints.length - 1]);
            this.drawArrowHead(line, scaleFactor);
        }

        if (associationDirection.equals(AssociationDirection.BOTH)) {
            Line2D.Double line = new java.awt.geom.Line2D.Double((double) xPoints[1], (double) yPoints[1], (double) xPoints[0], (double) yPoints[0]);
            this.drawArrowHead(line, scaleFactor);
        }

        this.g.setPaint(originalPaint);
        this.g.setStroke(originalStroke);
    }


    /**
     * 高亮显示task框设置
     * @param x
     * @param y
     * @param width
     * @param height
     */
    @Override
    public void drawHighLight(int x, int y, int width, int height) {
        Paint originalPaint = g.getPaint();
        Stroke originalStroke = g.getStroke();

        g.setPaint(HIGHLIGHT_COLOR);
        g.setStroke(THICK_TASK_BORDER_STROKE);

        RoundRectangle2D rect = new RoundRectangle2D.Double(x, y, width, height, 20, 20);
        g.draw(rect);

        g.setPaint(originalPaint);
        g.setStroke(originalStroke);
    }

    /**
     * 自定义task框当前的位置
     * @param x
     * @param y
     * @param width
     * @param height
     */
    public void drawHighLightNow(int x, int y, int width, int height) {
        Paint originalPaint = g.getPaint();
        Stroke originalStroke = g.getStroke();

        g.setPaint(HIGHLIGHT_COLOR1);
        g.setStroke(THICK_TASK_BORDER_STROKE);

        RoundRectangle2D rect = new RoundRectangle2D.Double(x, y, width, height, 20, 20);
        g.draw(rect);

        g.setPaint(originalPaint);
        g.setStroke(originalStroke);
    }

    /**
     * 自定义结束节点
     * @param x
     * @param y
     * @param width
     * @param height
     */
    public void drawHighLightEnd(int x, int y, int width, int height) {
        Paint originalPaint = g.getPaint();
        Stroke originalStroke = g.getStroke();

        g.setPaint(HIGHLIGHT_COLOR);
        g.setStroke(THICK_TASK_BORDER_STROKE);

        RoundRectangle2D rect = new RoundRectangle2D.Double(x, y, width, height, 20, 20);
        g.draw(rect);

        g.setPaint(originalPaint);
        g.setStroke(originalStroke);
    }


    /**
     * 设置连接线字体
     * @param text
     * @param graphicInfo
     * @param centered
     */
    @Override
    public void drawLabel(String text, GraphicInfo graphicInfo, boolean centered) {
        float interline = 1.0f;

        // text
        if (text != null && text.length() > 0) {
            Paint originalPaint = g.getPaint();
            Font originalFont = g.getFont();

            g.setPaint(LABEL_COLOR);
            g.setFont(LABEL_FONT);

            int wrapWidth = 100;
            int textY = (int) graphicInfo.getY();

            // TODO: use drawMultilineText()
            AttributedString as = new AttributedString(text);
            as.addAttribute(TextAttribute.FOREGROUND, g.getPaint());
            as.addAttribute(TextAttribute.FONT, g.getFont());
            AttributedCharacterIterator aci = as.getIterator();
            FontRenderContext frc = new FontRenderContext(null, true, false);
            LineBreakMeasurer lbm = new LineBreakMeasurer(aci, frc);

            while (lbm.getPosition() < text.length()) {
                TextLayout tl = lbm.nextLayout(wrapWidth);
                textY += tl.getAscent();

                Rectangle2D bb = tl.getBounds();
                double tX = graphicInfo.getX();

                if (centered) {
                    tX += (int) (graphicInfo.getWidth() / 2 - bb.getWidth() / 2);
                }
                tl.draw(g, (float) tX, textY);
                textY += tl.getDescent() + tl.getLeading() + (interline - 1.0f) * tl.getAscent();
            }

            // restore originals
            g.setFont(originalFont);
            g.setPaint(originalPaint);
        }
    }



    /**
     * task框自定义文字
     * @param name
     * @param graphicInfo
     * @param thickBorder
     * @param scaleFactor
     */
    @Override
    protected void drawTask(String name, GraphicInfo graphicInfo, boolean thickBorder, double scaleFactor) {

        Paint originalPaint = g.getPaint();
        int x = (int) graphicInfo.getX();
        int y = (int) graphicInfo.getY();
        int width = (int) graphicInfo.getWidth();
        int height = (int) graphicInfo.getHeight();

        // Create a new gradient paint for every task box, gradient depends on x and y and is not relative
        g.setPaint(TASK_BOX_COLOR);

        int arcR = 6;
        if (thickBorder) {
            arcR = 3;
        }

        // shape
        RoundRectangle2D rect = new RoundRectangle2D.Double(x, y, width, height, arcR, arcR);
        g.fill(rect);
        g.setPaint(TASK_BORDER_COLOR);

        if (thickBorder) {
            Stroke originalStroke = g.getStroke();
            g.setStroke(THICK_TASK_BORDER_STROKE);
            g.draw(rect);
            g.setStroke(originalStroke);
        } else {
            g.draw(rect);
        }

        g.setPaint(originalPaint);
        // text
        if (scaleFactor == 1.0 && name != null && name.length() > 0) {
            int boxWidth = width - (2 * TEXT_PADDING);
            int boxHeight = height - 16 - ICON_PADDING - ICON_PADDING - MARKER_WIDTH - 2 - 2;
            int boxX = x + width / 2 - boxWidth / 2;
            int boxY = y + height / 2 - boxHeight / 2 + ICON_PADDING + ICON_PADDING - 2 - 2;

            drawMultilineCentredText(name, boxX, boxY, boxWidth, boxHeight);
        }
    }

    /**
     * 自定义文字
     *
     * @param text
     * @param graphicInfo
     * @param centered
     * @return
     */
    public GraphicInfo customizeDrawLable(String text, GraphicInfo graphicInfo, boolean centered) {

        if (text != null && text.length() > 0) {
            double textY = graphicInfo.getY();
            double textX = graphicInfo.getX();

            float interline = 1.0f;

            Paint originalPaint = g.getPaint();
            Font originalFont = g.getFont();
            g.setPaint(LABEL_COLOR);
            g.setFont(LABEL_FONT);

            int wrapWidth = 100;

            AttributedString as = new AttributedString(text);
            as.addAttribute(TextAttribute.FOREGROUND, g.getPaint());
            as.addAttribute(TextAttribute.FONT, g.getFont());
            AttributedCharacterIterator aci = as.getIterator();
            FontRenderContext frc = new FontRenderContext(null, true, false);
            LineBreakMeasurer lbm = new LineBreakMeasurer(aci, frc);

            while (lbm.getPosition() < text.length()) {
                TextLayout tl = lbm.nextLayout(wrapWidth);
                textY += tl.getAscent();
                Rectangle2D bb = tl.getBounds();
                if (centered) {
                    textX += (int) (graphicInfo.getWidth() / 2 - bb.getWidth() / 2);
                }
                tl.draw(g, (float) textX, (float) (textY + graphicInfo.getHeight() + 5));
                textY += tl.getDescent() + tl.getLeading() + (interline - 1.0f) * tl.getAscent();
            }

            // restore originals
            g.setFont(originalFont);
            g.setPaint(originalPaint);

        }

        return graphicInfo;

    }

    protected static Color EVENT_COLOR = new Color(255, 255, 255);

    /**
     * 重写开始事件
     * @param graphicInfo
     * @param image
     * @param scaleFactor
     */
    @Override
    public void drawStartEvent(GraphicInfo graphicInfo, BufferedImage image, double scaleFactor) {
        Paint originalPaint = g.getPaint();
        g.setPaint(EVENT_COLOR);
        Ellipse2D circle = new Ellipse2D.Double(graphicInfo.getX(), graphicInfo.getY(),
                graphicInfo.getWidth(), graphicInfo.getHeight());
        g.fill(circle);
        g.setPaint(EVENT_BORDER_COLOR);
        g.draw(circle);
        g.setPaint(originalPaint);
        if (image != null) {
            // calculate coordinates to center image
            int imageX = (int) Math.round(graphicInfo.getX() + (graphicInfo.getWidth() / 2) - (image.getWidth() / (2 * scaleFactor)));
            int imageY = (int) Math.round(graphicInfo.getY() + (graphicInfo.getHeight() / 2) - (image.getHeight() / (2 * scaleFactor)));
            g.drawImage(image, imageX, imageY,
                    (int) (image.getWidth() / scaleFactor), (int) (image.getHeight() / scaleFactor), null);
        }

    }

    /**
     * 重写结束事件
     * @param graphicInfo
     * @param scaleFactor
     */
    @Override
    public void drawNoneEndEvent(GraphicInfo graphicInfo, double scaleFactor) {
        Paint originalPaint = g.getPaint();
        Stroke originalStroke = g.getStroke();
        g.setPaint(EVENT_COLOR);
        Ellipse2D circle = new Ellipse2D.Double(graphicInfo.getX(), graphicInfo.getY(),
                graphicInfo.getWidth(), graphicInfo.getHeight());
        g.fill(circle);
        g.setPaint(EVENT_BORDER_COLOR);
//        g.setPaint(HIGHLIGHT_COLOR);
        if (scaleFactor == 1.0) {
            g.setStroke(END_EVENT_STROKE);
        } else {
            g.setStroke(new BasicStroke(2.0f));
        }
        g.draw(circle);
        g.setStroke(originalStroke);
        g.setPaint(originalPaint);
    }


}
