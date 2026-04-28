package com.pethospital.hospital.domain;

import com.pethospital.system.general.annotation.Excel;
import com.pethospital.system.general.core.domain.BaseEntity;
import lombok.*;

/**
 * 医生对象 doctor
 *


 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Doctor extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 医生ID */
    private String doctorId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 职称 */
    @Excel(name = "职称")
    private String title;

    /** 擅长 */
    @Excel(name = "擅长")
    private String specialty;

    /** 照片 */
    @Excel(name = "照片", cellType = Excel.ColumnType.IMAGE, height = 70)
    private String photo;


}
