Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F5B3D565C
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781083617; cv=pass; b=Dzlyri3O0FD9Q+fQEd4kb6roDCRxtpBDexVCAHghMiDsBSJ2BDJJ/b4agIgY6eSDe/NEdU8QqyJtfCb4srt/k/3DtijnF5oy6N/1WXWn6dIXQJ7zr+z2YNA+Zy5QJziiT6QqtBCf7q9915/C3YXQBDnK/OWpKIFwbExtj3CJXtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781083617; c=relaxed/simple;
	bh=T3gJHGOV8CRi89pERdi8prAy/O5EkH++lIavw7aP4R8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=deiLcJRKyElEeSm6baLMpFV8VlrD4FbG1a2J/Ksh2FYR9HUlFle1KEo+wAKpXHoCxys4YAFcLe/m3Hl29tLaK57PVo2Isw3+FPqtgZ5TbsptLYUs9qiGlsuZf5b6YatxeVFco2hJjM+FeyE3kpXTRzb4T9aI3/o290Ro8hanV98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FknOF9iM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Baqrj/8N; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FknOF9iM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Baqrj/8N"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iY6F867674
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 09:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFk7Y+3XJuKNEXnnDZO+M/V8DgBSGCpZvdYQCl5/IjQ=; b=FknOF9iM2vTQiT2l
	xFlH1mloI9/jWKlw3nVEguBhv0tctQ1748tCKhLAvfpRLTdcTzCCCcjrZcGtz206
	xKqraF7DoAlNmr18AtUfZSW6yjUAkyJPX1jQ2f7miTKfHiHDikrqynYXZcq/UfYP
	9g5DRhiiuU+9I5M4oXnuIrvcZcQUvKxE3QEaSXn5IIcaSZSO+i342lCrMQFJdswa
	okEo0C7fBYdVEKvicoArRLuicNKqhZB+4J1Fs9euNOL8Gb8A0JqimyflaR72do0F
	a8jxoc/Grhh8qUENyhxiuHkmJa5pBIh35dSXUJa1tPbWOxEc1yNNqZMlh2zunGkO
	qbHMsQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd94vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 09:26:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91574ad681eso966324785a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 02:26:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781083612; cv=none;
        d=google.com; s=arc-20240605;
        b=UmoUnrXHe3eCdfF4TP9o77KE4gJPeL8vTH5xHy1Fk7zfwcgA8m4fHEEJ1A3eaTxhJk
         zWPJtB6oztpycJrpwXzVUWxh4h+P1UJYL1hFZqGHqwlAJBMXvYnRYDW8zOsYPzS4uEFg
         6y6KLU5sVXAplCq6GAlCkwYbtb14lyevE7EQnwANKHD+J0d5er/2rRoSy4qkIAeOAhai
         E56aMDB/otL+oOpPShUO7j17p9rDtbpXXTLG/KBmJvenmCY3ncZhqcBo2X7fr7EF/wSu
         pZ31mw3sMvPNHwpalz95rxoIr9DyfDX5MiOR9IRs3BugiWRGh/oqxlPMTgRKdWSZsGd2
         vvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zFk7Y+3XJuKNEXnnDZO+M/V8DgBSGCpZvdYQCl5/IjQ=;
        fh=OT1h8NHeGiaeR/cdsN78G2vJ2398amNdum56pfxgDFU=;
        b=eAryf4leq2dOMmbIRoeb0yyJP6rNKSX/71UtO9sL10yztWLAQHDuQfqCiKM8jiRxdi
         XNUl12q5VruHY8PHaH8uYJkBxHrNf5whw6Ooq+yPrxSMlDNjuUh/7XhKVnXZrVlpUwq5
         S5X8TfYPjT1gOGhLsADaDFNp0Xhy8t8ZuqtQ9FeZLlr03TtJ4/AMJum70jzDouQ94hbS
         LN99ohReeq9ScKn1UqP8RfPtIPUgjglkiwf6Swa3wC38eWeEHZW6J+roMEdJVy9HUjG5
         pfYI+i4Z5T3EC6OFyc8nxTG/JfyE81HxaBuA4fPv6rvD4sh/53rRNuQsj8Npir3dTAI1
         LlnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781083612; x=1781688412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFk7Y+3XJuKNEXnnDZO+M/V8DgBSGCpZvdYQCl5/IjQ=;
        b=Baqrj/8NXhMHu9nCOr5K5iUo7ZqLq3YHYLILJj9mfaEONKAmNax6alxXKxhNT+8w20
         Sd8PCmERUIkI4qweDRnEnK9EsVhI41euGX09+F4ZGFUBCDgUFDRRHzHoyz1ysEvcdDiq
         H5zV3Kb9u+GEggCrQgA9zCzjj/Rot6YXg7hPAyzG/xdkcJZZlpG5G6L/yzY7EAboTA2n
         AEtp/wFCvmmLrMJv9d3+EwoqvWV/C3RYPBibDDyx3Gn+1K3hiKWfQJWkoiNCL8dKNa5r
         dd1qR/u5SITY3ogdsy58VNUaFGs/WQXzuNGeqtiBLPN3XNJELafEiQwEp1HOOBUEJLqX
         5N/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781083612; x=1781688412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFk7Y+3XJuKNEXnnDZO+M/V8DgBSGCpZvdYQCl5/IjQ=;
        b=ccbAWseckZCW8rAQyeUNX/LOCuDgFneKjMPw8HNnvT4+Vt/ojbB7fLT8vlCLqJ7Cni
         NmrH2QvVJSQ9qtBiHzB63Tip8OlwITJ94PHfp5XhnVeL2k0aKgNo0E7uCyNIaU9/aZly
         ocSJhJPiG2+hPhKiV5EFCLAT0tWyFEncpEqWzZnXP4tz/7rGzzWqqKuQBdLQl6EXte+n
         Mv6sLrjCTGS8DjUurYl34/17YvtZVSZ1Geya13FLL+tWM8ttpz5t+2PgNJmHEY2OfERs
         SmATDx7msceLsyQDASx3zaFmfVMLfEKZ3ca9dANvXExWTBHnCIaia9vALWivqTNzyw7J
         W3bw==
X-Gm-Message-State: AOJu0Yw4ti31IruzEd6IvqAVsTfXbqmn+eBTTV5Qpc49/lwjatVnu/GY
	jfpDF8Tdh1v9ZHzf+bTP0QQi4xPqhK5VD5couVNIiE3wMDs7dAfQW6oRspo3nrfcNYvnel+lX1B
	Uvpwfm+6KSlORHChPKdxuWilOFAmoPzMZ30IrxRUjfogaw97CiY5qKNYEHjM68CvlCoVY84iHbO
	e8okw/h9t5boae4/gJGqaOJAvpc5/QprO55OAScmkg
X-Gm-Gg: Acq92OErt3Px/QnCRRA8o4jUQf4Cd9e1c0DdLgPMmp0/1pLQIam3prdJc6P9MF+tn32
	oqkrja0EvuD2c4fQLCABs/L889wxCwf+9xPVV3rdUvc6oZJgqjrRB+eI5SSxRpF/cLY81O6sigO
	u25s1+Z2DMjcplGBU0s5YNxJJMVcnz1l4BGi99++4c+cieoPkUi3uvy0W3Y6ESGQVHOhEG2XoLr
	olS3JJ4llmg5+AXYwdLiYr9UZClXhhwtPovyjjhk1Xjwnv2BhbBRtKc8FVjrsdfDKDo+7z4rlnj
	wjqmtNG9WHtuvvAlipMLrxzCHsSYX+T0
X-Received: by 2002:a05:620a:6505:b0:915:7c1a:1387 with SMTP id af79cd13be357-915a9d58a9cmr4143010185a.38.1781083612029;
        Wed, 10 Jun 2026 02:26:52 -0700 (PDT)
X-Received: by 2002:a05:620a:6505:b0:915:7c1a:1387 with SMTP id
 af79cd13be357-915a9d58a9cmr4143006685a.38.1781083611572; Wed, 10 Jun 2026
 02:26:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-monza-ina232-v1-2-925b0d12771b@oss.qualcomm.com> <20260610084357.C62271F00893@smtp.kernel.org>
In-Reply-To: <20260610084357.C62271F00893@smtp.kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:26:40 +0200
X-Gm-Features: AVVi8CdxDJZU3I6sOC-ENnBzyF_VWEQDK9FUcNB3E2lEochNP19iI-pGpns_wH4
Message-ID: <CAFEp6-3C0-g7P1m_0xNJj+uEqKJKKuoGk+LspzJgHxh8PKnfFQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hwmon: ina2xx: support ina232
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a292ddc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=MirW3AXaAeI-T4zOSt8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cx561hc2UL5dY3cNGldTisqbkC3ebzhv
X-Proofpoint-ORIG-GUID: cx561hc2UL5dY3cNGldTisqbkC3ebzhv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4OCBTYWx0ZWRfX44DWBoAiHtVd
 C46HUJ0FflT3cK5PmDxWsaMlF8tnCCgR1GttA6ruDdyCWsLAjH/4Rzj4bsDLvgfY1HSDCrQMEUD
 1asL0Yy1HmYKUvqdy5X65yUHVy4P0JeE/hs1ST0ROqO5oU1IOFCf6sFDGT31hnZKzJ78S87m6tI
 kAULokOLd/7NX7qNc2XDOQpMG2cDcQsVypdeOMXd/GtM1zx4fJOWIIMKkdeD1acML3tapMpxI2s
 UciFkGn1wjJhaNGNKsA6Vb2oBr/b6jwZpvWG5CGuQdvY0NXJnrE2rwUthQxbkvSaRvw7BrRjOid
 lJFaXnLz1QHGYyHrXqL8oOu//VRq3G4AvkgZIzcbCYVNf9312cc0sQW4v9N9POlb4ae2PntQsn6
 k05I0JB3ZGg2D/WU1UBxXuDqhOpWCDtBKOLvx6XPFtlAWVgvu8v4txYKnfy/F51YRUq1ENjPtJp
 wJRj00Wt90/UEBCr3tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100088

On Wed, Jun 10, 2026 at 10:44=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] The INA232 configuration implicitly omits `.has_update_interva=
l =3D true`, silently disabling sysfs update interval configuration.
>
> Pre-existing issues:
> - [High] Multiple alert limit calculations in `ina226_alert_to_reg` suffe=
r from integer overflows and signedness mismatches on 32-bit systems, causi=
ng hardware limits to be incorrectly programmed.
> - [High] Integer overflow in power calculations inside `ina2xx_get_value(=
)` incorrectly returns negative power measurements at higher loads.
> --
>
> commit 553d30269962c93d687fffb0c6e1dcc15cbdf020
> Author: Martino Facchin <m.facchin@arduino.cc>
> Subject: hwmon: ina2xx: support ina232
>
> This commit adds support for the INA232 current and power monitor. It def=
ines
> the INA232 configuration values and adds the device to the corresponding =
i2c
> and device tree identification tables.
>
> > diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> > index 613ffb622b7c4..122e7aa4fdfff 100644
> > --- a/drivers/hwmon/ina2xx.c
> > +++ b/drivers/hwmon/ina2xx.c
>
> [ ... ]
>
> > @@ -196,6 +197,17 @@ static const struct ina2xx_config ina2xx_config[] =
=3D {
> >               .current_shift =3D 4,
> >               .has_update_interval =3D true,
> >       },
> > +     [ina232] =3D {
> > +             .config_default =3D INA226_CONFIG_DEFAULT,
> > +             .calibration_value =3D 2048,
> > +             .shunt_div =3D 400,
> > +             .bus_voltage_shift =3D 0,
> > +             .bus_voltage_lsb =3D 1600,
> > +             .power_lsb_factor =3D 32,
>
> [Severity: High]
> This is a pre-existing issue, but can the power calculation overflow when
> using larger power_lsb_factor values like the one added here for INA232?
>
> In ina2xx_get_value(), the INA2XX_POWER calculation is:
>
>     val =3D regval * data->power_lsb_uW;
>
> The result is returned as a signed 32-bit int. For the INA232 with a comm=
on
> 2mOhm shunt, power_lsb_uW becomes 40,000. When the 16-bit regval exceeds
> 53,687, the product exceeds INT_MAX. This overflows the 32-bit signed mat=
h,
> wrapping to a negative integer and reporting erroneous negative power
> readings to userspace.
>
> [Severity: High]
> This is also a pre-existing issue, but do the alert limit calculations in
> ina226_alert_to_reg() cause hardware limits to be incorrectly programmed =
on
> 32-bit systems?
>
> For INA2XX_POWER, the upper bound is clamped:
>
>     val =3D clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
>
> clamp_val() implicitly casts the upper bound to a 32-bit signed long on
> 32-bit platforms. This results in a negative number, meaning any valid
> power limit is clamped to a negative value and ultimately programmed as 0=
.
>
> Similarly, for INA2XX_SHUNT_VOLTAGE, the initial clamp uses SHRT_MAX *
> shunt_div instead of division. The subsequent multiplication:
>
>     val *=3D data->config->shunt_div;
>
> overflows LONG_MAX on 32-bit platforms for high inputs, wrapping to a
> negative value and also programming the hardware limit to 0.
>
> Additionally, for INA2XX_BUS_VOLTAGE on parts with bus_voltage_shift > 0,
> the calculation (val * 1000) << shift can exceed LONG_MAX for limits over
> ~134V, wrapping to negative and setting the limit to 0.
>
> > +             .has_alerts =3D true,
> > +             .has_ishunt =3D false,
> > +             .has_power_average =3D false,
> > +     },
>
> [Severity: Medium]
> Does this configuration intentionally omit the update interval?
>
> Because has_update_interval is not explicitly set, it defaults to false.
> This hides the hwmon_chip_update_interval sysfs attribute, preventing
> adjustments to the averaging time despite the INA232 sharing the INA226
> register layout.

These are pre-existing issues related to out-of-scope voltage and
power values. They will not be addressed in this series.
