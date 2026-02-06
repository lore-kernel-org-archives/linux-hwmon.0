Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FCA355023
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Feb 2026 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770368894; cv=none; b=owjEcMWi3RQoyC1RqO5Pk3HF0n7fIXzOgwXxIxjXErdX81RJgS605NS1IdcB7vKxvtCP3i19mDbBDxJucgcetRohutW/nbI3RwGjmzWyszBufwEXKjL4YtW3QM4LaH+ofWHl9WE9wJnzvepW6QYg+9ORSY192rAwxIdx//38smM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770368894; c=relaxed/simple;
	bh=jcorV5fNhJ/Si6DgsQAMbsggqQpXGcQF2L7PDoXMTK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3FD0ESyZDTKUzVg5fW/uYFimEaGjzh8XjbCfBY/EJqZGh6/c8hb5JHKOttmYUlunmLAGuhBqdtbwiHdPL2WARsmp9i0JZe0QMpQ5FTmJ3XRDBQuu4UqD2rs3jIVQYbESf+SekwbJ1GT2LyezsRoaqq9hzef/D7O/Kilmr2ijow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oZ2clOSh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fufG3zOZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZ2clOSh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fufG3zOZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167Xqdi2482148
	for <linux-hwmon@vger.kernel.org>; Fri, 6 Feb 2026 09:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ONFHU4Ha8uMnGbIr4aoaMHAM
	BXPybTTmBHpojnt8ZoE=; b=oZ2clOShfELHjFG1TvgXaHY7H5IS8+suHh90KY/w
	6HhtJUt7sUJq3eAeovCUZVM5V3TZ/k8W1tBrPfhEeJcIMopTLFVJt6gG9XJCZQTA
	XPUfLiyzmihhIehUTNtgLlVnMe1ZKylk9oeUizBX63c+FBbo+EWuH9bxLfd7L/66
	nnW8vcLXubLqi6a4LZfbQk+/EHYsxaeXZs8uTz7HtrFNhG2lC3pEv9wBYYHN9PYP
	XpD+GTc4WFR7Ljb6UHVW/18wYo37zVDXzM7wl85DTz/A8i7LrCQAtLjln+Xok2hU
	zoPVZhqofSFnsSwPT4kqdFEBFA4uiEKLIM8h6BX3Gf3OAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c170afw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 06 Feb 2026 09:08:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a5bc8c43so593155785a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Feb 2026 01:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770368892; x=1770973692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ONFHU4Ha8uMnGbIr4aoaMHAMBXPybTTmBHpojnt8ZoE=;
        b=fufG3zOZXJpL47sPtG/TCqyyRuwZU4j/rg5Cvdy6F5B8IGfzXHTCO+/z4YhcRgd2Kh
         y0v8uEzRB9Ob/L4xluyhEWU6HBBo2UQztRTCsPJEpj3kCfUIHEDdnT7+8dsTvFPAhjMO
         b6myNg4yygGM4FNmUP3novYXqDGNKfw0/+bFtcavN3AO21WJB6L5gKmchPk2L6GQkUuq
         bRkk9WetDqXFIW3uGyj74omtZHzOEK5Fvpe+VZRle01cpDi+KfqUSFKKnQsI7+ajVepL
         IFfTq6jn/T9ERksw2SaGbzUXOG/3pUw8JV07RAF4OSHM43r7TtzXRjhqr5jFS8knFPVy
         wQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770368892; x=1770973692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONFHU4Ha8uMnGbIr4aoaMHAMBXPybTTmBHpojnt8ZoE=;
        b=IW6hYbboqTOobwxAmSvHMAhpQK4H0kb/UtQC+4TxBcGmjosHh7icawTkeHXhRPCF5K
         vtnvRdiSS2/Oqi1yFNjyeXrZIQZcW2SXAQWv1fXxkuXSDKlSaw5YWL11LHZC2ETlCxDl
         7uh3hOzDUw2V12+AXPFtdzFLGZsiE3VtJ8csylpcvGGLaMck1FnvQE8QJ1PKJmrOvbLF
         Je7sxDCPAwMLnDcFCslD3mGJhiunO88ILIGUUJ3ISdopYDEW/cb7zR5lXwdkKo0+riJX
         GSoCsLqG6hqK1aBL68eBfuS4YgnUxesLEIo4bDiZZqXC7Hqiqcr/Y+ga8qVDo2YuQrpl
         eXtw==
X-Forwarded-Encrypted: i=1; AJvYcCXy35qb2K42yGK/6rSZbHRW+W8x9i3n+SkQxAxYXG1OdA6X5FSqEr/+X7PdT7+Cmm5SX7YPqA9wSdWnQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YywLNeQplhojGKpL8FeEY+DPlE4mt2Q6obPGeFzjVUqSsAxJg5S
	2jpNf78xTL6puKwyPYfNbfFHIDmiwWp3c9uVU3uo5whJEZa/E/MuIswXGX4KJw132Jn07xI87Hi
	bxJGVKhBgYTB7qDgPrEak2UyrRRoXBS66fwaq/aIw43OmYY17ExnpbUm48WWHoxMq3g==
X-Gm-Gg: AZuq6aLkMfdQxuGgx64G+eVKzc9X5oag5mA1CphxDBaLuZ8ZlaSAmpgsLjPEUBCwnZ7
	U5dJPGVwoFuWPIXHJ1giQfHcSaXrylcyGjhz8CEAEh1pK7gMWIAUOZtcoYzCImKVOm7bBARY4zM
	PkEi7Q+U/am30EpdGtv7qhp8E7uWWQmsCZaMOP7fc7A+v2qY0CVyqOrEirg8g3KZ4u/I4tNGD4P
	Jb8mv5eytCWVqI5i0IFtW1bkpJZZzafx9MTTqcqbxMeVZr9hmQ+NcHaU3i5jWQu37OvhZ1wUY6k
	Fm/aui3PiC/WwBjBQpBF1WFQtGV2sHfLNgIFo2lzKlCTB1L6yRkOZfykSa9iaGiNbYEsW/sMUfm
	49KPKB4upz8HRv2c/ydt75bnpQvdaS2SnBe1QQpxalQNg4jsLf+FWdQ1YLSrQr5ybpiaHoa1XJg
	V4igpFNBhCvSJiB5wqP1v/xuM=
X-Received: by 2002:a05:620a:4553:b0:8b2:ec1e:fe24 with SMTP id af79cd13be357-8caefdc0ac8mr226779485a.42.1770368892362;
        Fri, 06 Feb 2026 01:08:12 -0800 (PST)
X-Received: by 2002:a05:620a:4553:b0:8b2:ec1e:fe24 with SMTP id af79cd13be357-8caefdc0ac8mr226777585a.42.1770368891843;
        Fri, 06 Feb 2026 01:08:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e232b3sm422178e87.80.2026.02.06.01.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 01:08:11 -0800 (PST)
Date: Fri, 6 Feb 2026 11:08:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
Message-ID: <yrhfimj4ggs4ecy4qg6lve6v2hc5tzjvya2bom3paialuocyae@6xc4ulemx4ng>
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
X-Proofpoint-GUID: 7szI_4WwZ8k_6PAxla2Ff_FOXQPIy00q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2MCBTYWx0ZWRfX80KBRbty70eu
 l/G8mQLLpx0SA1lUTqLbSJJxaF9epqPG9vCLS8E0kKYkMsEEsLCR4UejjnxpqWw4bt3U3kokMpG
 Fju+Vjyz5CkHt93/Ptt3CMFhxQwFtkc616pT+GLSK0dP5tqW8Y+5BLC1ohqjHs+DsHTCEsi9dI+
 iCId0UPyehuErYfynxf1FQoFZIgqRPTrvV3tFVnnthocyF4NUcmodCJTuN2zwiTU5eX14ZdOT7Y
 aL77/GrC1GuhWH28F3kcV+/6hS+vRaRG13dSJOhCKJVQfYYt2ibKyhKECgCHNvaLv0wvr78/b3C
 grwCxTVfFall3aDifN/4mYjxvVaIdSwBX9Cc/jXzkrSYL/vFkYnXMREr9Lcy97HWIDv9EP/LqBE
 oESvq+JeRjjzC53LJnUb5uomd9f9RSNecnChm9e7FA+sX/d3zmypLtC5L+63+/lRqmtAG8Vyibk
 bCfn7dxw8LvLY0RFbQA==
X-Proofpoint-ORIG-GUID: 7szI_4WwZ8k_6PAxla2Ff_FOXQPIy00q
X-Authority-Analysis: v=2.4 cv=E7TAZKdl c=1 sm=1 tr=0 ts=6985af7d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=AYnPP1rroOHV-a490rEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1011 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060060

On Fri, Feb 06, 2026 at 02:44:05AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> Add devicetree binding documentation for Qualcomm PMIC Battery Current
> Limiting (BCL) hardware monitor. The BCL hardware provides monitoring
> and alarm functionality for battery overcurrent and battery/system
> under voltage conditions.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml  | 128 +++++++++++++++++++++
>  1 file changed, 128 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml
> new file mode 100644
> index 000000000000..a0e8eaf13eec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/qcom,bcl-hwmon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SPMI PMIC Battery Current Limiting (BCL) Hardware Monitor
> +
> +maintainers:
> +  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> +
> +description: |
> +  SPMI PMIC Battery Current Limiting (BCL) hardware provides monitoring and
> +  alarm functionality for battery overcurrent and battery or system under
> +  voltage conditions. It monitors battery voltage and current, and
> +  can trigger interrupts when configurable thresholds are exceeded.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: v1 based BCL
> +        items:
> +          - enum:
> +              - qcom,pm7250b-bcl
> +              - qcom,pm8250b-bcl
> +          - const: qcom,bcl-v1
> +
> +      - description: v2 based BCL
> +        items:
> +          - enum:
> +              - qcom,pm8350b-bcl
> +              - qcom,pm8350c-bcl
> +          - const: qcom,bcl-v2
> +
> +      - description: v3 bmx based BCL

You need to explain your abbreviations. What is BMX? What is WB (and
yep, they should be capital letters). What is the difference between all
three of them?

> +        items:
> +          - enum:
> +              - qcom,pm8550b-bcl
> +              - qcom,pm7550ba-bcl
> +          - const: qcom,bcl-v3-bmx
> +
> +      - description: v3 core based BCL
> +        items:
> +          - enum:
> +              - qcom,pm8550-bc0l
> +              - qcom,pm7550-bcl
> +          - const: qcom,bcl-v3-core
> +
> +      - description: v3 wb based BCL
> +        items:
> +          - enum:
> +              - qcom,pmw5100-bcl
> +          - const: qcom,bcl-v3-wb
> +
> +      - description: v4 bmx based BCL
> +        items:
> +          - enum:
> +              - qcom,pmih010-bcl
> +          - const: qcom,bcl-v4-bmx
> +
> +      - description: v4 bmx with different scale based BCL
> +        items:
> +          - enum:
> +              - qcom,pmv010-bcl
> +          - const: qcom,bcl-v4-pmv010
> +
> +      - description: v4 core based BCL
> +        items:
> +          - enum:
> +              - qcom,pmh010-bcl
> +          - const: qcom,bcl-v4-core
> +
> +      - description: v4 wb based BCL
> +        items:
> +          - enum:
> +              - qcom,pmw6100-bcl
> +          - const: qcom,bcl-v4-wb
> +
> +  reg:
> +    maxItems: 1
> +    description: BCL base address in the SPMI PMIC register map
> +
> +  interrupts:
> +    minItems: 2
> +    maxItems: 2
> +    description:
> +      BCL alarm interrupts for different threshold levels
> +
> +  interrupt-names:
> +    items:
> +      - const: bcl-max-min
> +      - const: bcl-critical
> +
> +  overcurrent-thresholds-milliamp:
> +    description:
> +      Current thresholds in milliamperes for the two configurable current
> +      alarm levels (max and critical). These values are used to override
> +      default thresholds if a platform has different battery ocp specification.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pmic {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        bcl@1d00 {
> +            compatible = "qcom,pm7250b-bcl", "qcom,bcl-v1";
> +            reg = <0x1d00>;
> +            interrupts = <0x2 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "bcl-max-min",
> +                              "bcl-critical";
> +            overcurrent-thresholds-milliamp = <5500 6000>;

How is going to be used by the power supply subsystem?

> +        };
> +    };
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
