package com.pethospital.hospital.domain;

import com.pethospital.system.general.annotation.Excel;
import com.pethospital.system.general.core.domain.BaseEntity;
import lombok.*;

/**
 * 轮播图对象 banner
 *


 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Banner extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 轮播图ID */
    private String bannerId;

    /** 图片 */
    @Excel(name = "图片")
    private String image;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;


}
