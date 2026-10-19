Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C69152631A
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421550; cv=none; b=uk+zWGdRGZXuERowazL8iNc2c6SL3TUr3yEtp6SwLIhJt659LbBxn61DDm+opIdKEN049OTyRCCRgBp/iux5G73LRhPuh8erLwZ3UHOw6T2AwDjhLgVFU5N2GwdFNSEIgf4nkJBEQAviGJJdBqUcuU0ZbyfkbF5CHbCApHh31X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421550; c=relaxed/simple;
	bh=1K5H105kxuN+ZVKT6leBzx4HfbQpcRrSq0RyZndHnM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaVjmvj+FmZwx9rgB/Ontt6aEXYjuirwzduP74B8cAVbjuLsNbHssBVA+4+Zoroxf1aZEXUq3cUl+L89hInML/IRoscNZHDLMspsZ/qBy5cpmoYyaE44EGwWI5KEpEM/RBI2JJ1pCYFLzJmOG04WOf21+12IbpMPAvq2xba90O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcj4Pdhb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a0XaDEqi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcj4Pdhb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a0XaDEqi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0QeU2925849
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JinI4suoV/PemBqLc4GnyUwlyXTR/Q4HYVrbGwhNsTw=; b=bcj4PdhbvwkmQAwO
	asgKt1TDvUmcXWN6CUn2RC4pNw/poL4hDAAc//4xFP6t4HMQwYLiyVGlRkNg88u6
	IN0YTl/lfyBbes3BBjo16WuQGXYLHG3ZWB58d8uzu3j5M41WR/FlRQkXHTfKuW7X
	aeoG7seNQzShQ4PomUdkeR1Vj2PXqizfentckUQh+4ml/2pCy8/J3GWptU9f7n3J
	bVFb51EvsNlj6eIA1j0OVWt7wSgYXCByyP3Wex5TRK4PrYvY3qF8ghH891pMBZ1L
	NU64Aakiune2ofifbHeZ/wAi4rjSWkaWbw1mNiiIN4IAIan65qhY4LCpjlAwvAIh
	PFXPug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1bb9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:52:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso35814885a.2
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421548; x=1793026348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JinI4suoV/PemBqLc4GnyUwlyXTR/Q4HYVrbGwhNsTw=;
        b=a0XaDEqiBJ7orIjLFn+08ohxZzapooO4lmjz98MgLPa+X8OdIwcnkk7XBtdqOrWTMC
         IhJurdx7cJhlQkireW7A8ul9t7hKd8IEP9F1c1C2g6S6wfXzSOOsjRBlqHA2oYzCETSP
         1S7vbTd/weJGOSCUI/tL/ErJZjZ/UMuomt9XukarmwOj4fKrlqv/bRnSPgcOKRJqLTLC
         jIY9faYmKN2Ckfqy3IfnDzmZ/hUzRUcG6u1eybizybnG8sGHYEz0OxN7GwUziXe6T6qA
         I46RHjLLpmQ328jcom9wtHuxWcscQRe8j1fvyqJSiYpvYa0h6lqDVVtfhopybzATLYMy
         Ffvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421548; x=1793026348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JinI4suoV/PemBqLc4GnyUwlyXTR/Q4HYVrbGwhNsTw=;
        b=YT/ML0OSgE0pfOliABj2p+lMU2afPsA//2/4wi1XfL4+k97mO43OsDeKZ+4qgRNFY3
         sYlKQNlHo7lGg77+UqWwGX5YyhlD3CVXLe/U0u1Ph4zekqcW2/770vB2zLSiNeqIeU4x
         lHJOv82ln/xLmk/77/VSqyI9ShMuN2eAj+oo04LUFvc4iShg8aaL/I1xu+JlyQN9epLC
         S4HOwYNItzA9jSr6vdHYIa9be0Bo0HnEvaBkudR3nKb+ENpevroKNQn6khlQazfBVO1n
         jx2RKwrryJmZor79pwpLpWvl2vffCaSR9r2Fg5liezN3MFX0Gq7yv5OK91DSITnL/WFl
         vR3g==
X-Gm-Message-State: AFq9FYI7uSv/aozASLAinT1yGIvFFf5F+Mnsa5l6ubbsAXV0vmGxreBv
	RyrXAWuXsfbNTRuRNuQuoFQHxNlZ5X7I3G94QnvMGO0sqmaB01BhP23S7MqFqKAIPRK+Q79h4vT
	kihlMwGLeZWan1VD5kXP8EbCdlSj3xfwJb4bSZqM2tPfhFjlv4YLhPH4RXDt761TLiw==
X-Gm-Gg: AYBFou0fYmKlTz0QEdbxPM06aykrqsfgHpv446qUA0wELsRdVfDW96qEukaNPicrw5R
	PECJro3Qe5L9SyAN407jHN9YlATKhWGYOA/PYlO+RKP9txsc1BydV2MIqzQnPRJuLXBKMf4yptH
	sCQ6tVx+Lw+RZr4jU78VDIzZP0HfK10Op7vQea7Jo0r0SRafsxHe3ccpo+YXYNl/32MzOhLckKN
	F56gReBjLBL3WkJ1SApeTA3y0L/zaOWEqqVX0O5pz5b+2R3WtGi869DhQs5flhT0FVfVqlmE4XY
	6bfh4f4an7qjcsjZnwzJfrKFZdt9izmIgEjUxqTVWyORxWOa2tPJTZlzi6Ad3s3uwWQUY67+cBb
	kQ4U2Y4KInrRRrCXv91x2Gg==
X-Received: by 2002:a05:620a:40d2:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f299e5cf2mr1473238685a.0.1792421547766;
        Mon, 19 Oct 2026 07:52:27 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f299e5cf2mr1473233085a.0.1792421547217;
        Mon, 19 Oct 2026 07:52:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf335sm373853966b.29.2026.10.19.07.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:52:26 -0700 (PDT)
Message-ID: <2aea5502-d9ae-4df1-abbb-9c5ae812b80a@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:52:23 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-4-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-4-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX+fIV9S1sFS53
 R7Dvs0j5pQ5p78iV6k/7bnh5A8eDePy+bFfdTy+e9BmSfcvd73QLa/JBkka2d5roYAr1h31qxYw
 3EF7pfu8VL8EfSzgscoEi9SKaZJ0Q30=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad62eac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_82NC3t17uPQdkoQo54A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX+ZpRVRXUzpOm
 eNQXsuS+kw0WAhupQPOyI3ZX/JDOjo7uONJ8MIBOPBFdwrh6sBn3pShUyxS+MVTvlhdwHiup0K1
 JZaY25LEMM7NquCNRsKEF+Em7KnyzFgKp16Z6tO1mFDKQynmnwUwgD4RkKP9spP9CpVjmHwlsTK
 lbHtQRTQDPmTguKYVOpoHh9iYgvyTvZw+aVrfjogs21pO1kk5idAZ2lT/7b5CmyoxM8Kal29gBx
 IY+3yYIsTN3DUlmNBDUF25pS1nr5Xc42Z9MKpbc0zJlamllAoMOuL4f19oNpSVk8PmO68P7OcFz
 J5SIS8HUAj69jb3/uqziCZAZgPQWjChxrUo3JiNTZ+V/DxPkYsWKl6pobMxEA4FtmPmTj7ycmiX
 Gs7dnxQQ9KY1rCLiiMs51zeWmwLjh4ARqdA/n3qEB9Iq3nNEZcDRBIqAMY83RRvkqiTzesnpFv2
 UEZn5LTdoCwloiuLAqA==
X-Proofpoint-ORIG-GUID: iN4c3UZ6a0Y043FMupo4hcKOY0XbaLj3
X-Proofpoint-GUID: iN4c3UZ6a0Y043FMupo4hcKOY0XbaLj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
