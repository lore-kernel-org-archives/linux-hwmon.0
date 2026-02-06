Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0CE3502AA
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Feb 2026 09:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770368908; cv=none; b=ed/kgqLEuPuv+LbNjBC63V6q2Jf1j0qfWOd7DiQecYkHl5bb2B0Ixs6vlt6iI73p70S9SxStdwCGcjfKRajV9B6LznjddSVgZOQ43XB+uZYCJ8OdT5QFQqEqqsfA8jXTNQPjwkvnu6kYUg2xWYZdrc5yD80TLthm/41f4B6db7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770368908; c=relaxed/simple;
	bh=zBCqNZ+AuqWehphRfYE6MhxD6r8Q/yJ3qqNjiZFTg4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blhZDdLKMismvAXGvM7X/8gdMbV6wYLop7bmf7kwHH+3t8CZM+/Vvp36J3lLmpgBlCCpInV6dLIY5a0wvAsiJ8jh0rBp5osR8KbGvK5BuLu1BdpTL8b7XXive+Z7x5aJAVvT7CxRFeJ/Ob7YEw34O0kx1aSGLMCDSomvKcK+Ztc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQAvBaya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bEofF3Xq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VQAvBaya";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bEofF3Xq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6168J1qJ1630569
	for <linux-hwmon@vger.kernel.org>; Fri, 6 Feb 2026 09:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZM0Bi7IxsuLghixrE73pIpbS66cYLzO9BRfLMvmPPAs=; b=VQAvBayalromAyok
	zTbafR775IsYzl5HQgkZm5QLIhi7VO5ZwEBHU4rkxSS1dgI3lxesMDBy65JA/J1s
	w56C48dCuUMB6sd0406OWmaVxLYTdRd6L4KHwgr8rKULkHXMPoPzJ/YN3lnr3IrO
	HywnY+wsnu0kLmjOnFInUJVz2psq9Kgz+/Zr/629MvCMTmnkIO8SSK93rcW6H5s0
	dHyK5BjRCZcSyloKhnOKKpmJYcH42UKz28EdCuJPk/Qkzv9MS+ykfPCVTkXZL1Z+
	DGhyMupBntBlFf2ZWpXEwBhQ7RQVm6iGp8QB4kV0XfddKU5HCRLB+FuBpHxhJ6P8
	AfdbiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tm8uvwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 06 Feb 2026 09:08:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c7177d4ab4so50715685a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Feb 2026 01:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770368906; x=1770973706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZM0Bi7IxsuLghixrE73pIpbS66cYLzO9BRfLMvmPPAs=;
        b=bEofF3XqYyIlin2QRh4up5envsbWAeL1cF+WM0bb1lLuizRjTcbN3HlNkt2UnF7nMB
         j5WkmwicV4e04pI9IleqxZ/V/aZX3Z2qTFZD3/OJdePEWOGyTHigQy4xmGbOyEiiKHY+
         lCV98N1bvKL0dPKHP7jVeeifk9ytQzzoBj3B8t2o/pe6/1bxCWONL7Unq5ELD4+FJLeU
         EFju36VTQ3n63IvtxvDPWbvWheTStrXEDbDEpvznUo5L/TdCJfEdUvvNQunUMifC+7nP
         iFPvwqQKNdxgVTAiyejHX03OgKULPxarlNs48IXM6PsMBBAusy9rdYxKT44Nz/gCJm5z
         B3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770368906; x=1770973706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZM0Bi7IxsuLghixrE73pIpbS66cYLzO9BRfLMvmPPAs=;
        b=BKZVt2Lik8JrGRhqMWQijB37CORc+XimnVhmjDY4drylCFM7SfBFlfnnNm3Yef0yj/
         7VCqZRuHJzGzKoeFBpFxMPoVjpDI8W3Iax3c6Rhlhipnq17b+tYHikLPC8aIyPBq1fzP
         +yphvwB4y7B4izLuUiFLIx3joIcynOmU2XT4/3j7osQzXFgbPQfxaSGwLCyRcFrm0ixv
         fgl2rroT8njZ5E69bbewOmW7Lv+0pVppWuAQ/XY9kdM2kJ5bhL20U78WixCFeFnvEpmL
         d5KzkGMeZoIi0XeX0KxfMCiQOz9da66j0Kyf6KYuhn9NsR1cyqS842aZalxfOpW567vd
         5XXw==
X-Gm-Message-State: AOJu0Yz1b9YBKjC5p3oQI9plx+CH6PcOsiy+vOSNhkdlfiVT3lgp1fO7
	LIqadAal75LEuIWCU0cy+KXg/I+xAOBKuf7jjKwSAtpQMAvAhyxQqSeKnpTlJJexDkkxR1ufjhi
	e5IMVI8f4QLMzOD6TxdtkPIeHDAr2+vbiyGDY5TV6OXIKpK+e9YeGO2dMycRg4ZcoUg==
X-Gm-Gg: AZuq6aLuUdO6zaE66IbK8iUG4DyL0KP4juiQ9bBqNiVJqYU1bRcyDdD1kn9MZr/wURX
	7r9HUjgI9zFuKeSYVUzLMRZrAYJ36Rz2yt29wAcN7XHH11DBo1l0GyBRtH5E2WowP/Jw8Fvf1Hj
	hjLbpXcGDXRZcu6mLs71dcOcVWh+0OS7Ps/GU4OclcN4gG9FGu9Oms4dSZ+XVryXIFqh93j3a5q
	BFq6Fx1eTL1MLg8NATHlujW+Tz5ryPtQnzLz8/Y4meTP+b1AzjcbOP/Lp0Oa1NGT7QWgzs2Hhwa
	I2O9tQxtbd36ECDjxhOaU62ZSmiO/htT8epRqosq4CVtPZ5kL9ues/UtxwbxUbQpqUG1HVRHbBT
	olcBA637XqjS3iV03Y0hT3z/TcunimNTjxM05FALiD79Cv3+IQePiKwedzri3QdpJD+1UD3vCAF
	ZQlKM=
X-Received: by 2002:a05:620a:3185:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8caf0e3369dmr187754885a.7.1770368906396;
        Fri, 06 Feb 2026 01:08:26 -0800 (PST)
X-Received: by 2002:a05:620a:3185:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8caf0e3369dmr187753585a.7.1770368906024;
        Fri, 06 Feb 2026 01:08:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacb18d0sm65020466b.40.2026.02.06.01.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:08:25 -0800 (PST)
Message-ID: <ae2802d8-2eb4-4dcf-8212-d8f2a41a7185@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 10:08:22 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vd76/Vp9 c=1 sm=1 tr=0 ts=6985af8b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=JYVwdDW7bhRS7TmuI-YA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2MCBTYWx0ZWRfX6ayeaXkF9xNk
 r0Gh7LuoRxBmuxqOdeI+AVCxZjCBY4ycUvetfI9ANq8RU0nroE3ubxNdU6XuNEnZcdVCUql3RhJ
 DnIDEcJMdYp3R/ibrmAvVFu3AuK1GtuchYVkrweLi1DGOsRwe9MJUh0i7H+Z/6ZTtQW/4HfuOy7
 b0eX5QcLmdPBKnj1OX6VYcIeaeuxLA9xlTDwCtmbbkxEqKzHCyqrS44Friw7JGcyE5D0/p/RImO
 XlomD4v4BGvzmykWwJxbKIzsePlV3oe4nOLBFPX+pNtZHA9/LoXrrnyR6VU1dWwKEmCjl4XzvTI
 GCVGng+KG5eFsUdDyYWBt+pdr+TMexNAwcMCqP5eOX3zVzyCcd/y1pc873sFWVhk+/rhztCtPn1
 4X2WjoT1qTIT7x+Sxnc+ZZQJ0e3oqv+YX5XKEZ7sf11MuliNbH88GOe+vh5ccwTFePpD+/EDRVQ
 dz0eeWmVnMEu01NCPnQ==
X-Proofpoint-ORIG-GUID: 8iVGLWuxhwT42HfPTqXQzFDkk14h1ljp
X-Proofpoint-GUID: 8iVGLWuxhwT42HfPTqXQzFDkk14h1ljp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060060

On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add devicetree binding documentation for Qualcomm PMIC Battery Current
> Limiting (BCL) hardware monitor. The BCL hardware provides monitoring
> and alarm functionality for battery overcurrent and battery/system
> under voltage conditions.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> +properties:
> +  compatible:
> +    oneOf:
> +      - description: v1 based BCL
> +        items:
> +          - enum:
> +              - qcom,pm7250b-bcl
> +              - qcom,pm8250b-bcl
> +          - const: qcom,bcl-v1

I see that e.g. PMI8998 has a BCL block, would that also be 'v1',
or something else?

Konrad
