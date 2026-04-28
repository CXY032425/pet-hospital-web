package com.pethospital.hospital.domain;

import com.pethospital.system.general.annotation.Excel;
import com.pethospital.system.general.core.domain.BaseEntity;
import lombok.*;

/**
 * 养宠知识对象 knowledge
 *


 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Knowledge extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 养宠知识ID */
    private String knowledgeId;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 内容 */
    @Excel(name = "内容")
    private String content;


}
