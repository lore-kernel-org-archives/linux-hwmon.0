Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDDD541E55
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 12:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078627; cv=none; b=h95Cpo+HRJLcuUrzHS1kzmDUT97yimCt14Uq6QKn2Xm0+sB0GIT4YEg5qfewjjnsBgNU6KA5NLrSjlZG40LtdgORdL6dCvB3oN+yT3ncb8OO/BNgjTyG+sl8uRNpb74spFMEFy8w22DddSSDNDYxi9AfmyN2KvzHu+7Ujjq1tvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078627; c=relaxed/simple;
	bh=SZCXlrQAryWhTDqNuUadzwglBxE2aUkKuezLoH0aDRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ND9WsOYPf9CWWnbGnxRETA+7Dbr6wjb5F+cKG1rzpW9iUZU390n8swq4YAHsHSSaWqJULCal9zypm1ZIOvGXvaI45RQdwLnyOukkf+TZlo3ELP6b+W1mgh/3wiEmQLXZaT7r44Vb/oK7lhcj/FNgAodObRpgkAdBw5ZCcWgYyFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGIYyFF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BgAdJlHE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGIYyFF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BgAdJlHE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPYPu3487079
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 12:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7a776RgZFeskGxVekBSZFf3BASD5Wked69cTCRkftEw=; b=XGIYyFF6dsfvo/OU
	YLl/mPQe/Z9bzqgu4v0+bXeQ0CJd2miuxkagDmzl/TfuBjcBy+Z99sOY+bjtFM5s
	Lbz/Xf8mxKHyTBYtmHvGxKhXrUx/caCOuqMVt25HIuZi4BRXhfJNEJc8IaBov7f6
	uFc9CRghMAdywstpZ2eb7qfZzN5U4FwdssqDJn8/WJrw/tYhtzS1RtvHax5dLoos
	e5kf0/CR/KcjLZYmg1lmRnzL/rjR8PlQfNOMkB5tzOamiqPsj8J9uyZUIAQLA9Y6
	/HKqC/4/pcFVBFvPj1ujY9lRgKL5EUQTccV1ODfAnsJ2TaAXDs48gejNjzDgrUP0
	arvSqA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0jqe3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 12:03:44 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-45927d9afd3so222853fac.2
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 05:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790078624; x=1790683424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a776RgZFeskGxVekBSZFf3BASD5Wked69cTCRkftEw=;
        b=BgAdJlHEET0Zey4poWZlccsZ6t9o3sp2Hx6+OcU9SiQDPxiD1gHWTwG7Nv2Z9ciNFb
         /E/3UHlUU5lcLzqrrAY14RLj+BNGNE4zpy88eWg0G5a7WJ1Nw43M32FH7zVGI7GAObbu
         XZE0sqMBscy7WPt6AxAG0VlyO4H4a1kqMQCCQL+toQil+CWSHA6w9igeZzbZKSBW1Z1h
         U0IHDzEhjVYUMSMwtxStcoyGa25r+RAf5VF6gkUIYJMFBkAm8SH4V0DxC4FnA9lPG8R7
         nPfxK9fpHajBBO13JHqC9bgCO0zBKQYwA5ZNKSwY0/eU4U6ZO0Rl01FJRlsN0g+xm7i7
         ObbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078624; x=1790683424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7a776RgZFeskGxVekBSZFf3BASD5Wked69cTCRkftEw=;
        b=NY3y4Q2Fd3LPTliJWSyIVRKnIIA8sGt8sMNPW2RFQcRozsgFEDeQHDW5odGFIOhGud
         ca6Ow2aj6lqw8qTME5blBwFdwp/6hniM1oT0UtJRwNYD6br19XuzTUnfKyXmLwQxZ6m5
         Rfsd+VFxRWHPXKz9es+a7HVi0st6YgU3aOrs5Dc5Rln+yGwKp3y9Nn38pWs7wlCHYUnf
         Vbd5yjgolAurPPJn31c8LtPuhWcNHQJWEEsgrfLDbTqOBBnyIsSs5DgF4hbjplw4Knw7
         HPOxN0cKbbVpV0DtKmZ8sCCeOgw41rmyM2hge8clmN3Se1buOe5zGeRWcU/fJWcY9DPz
         5W/w==
X-Forwarded-Encrypted: i=1; AKwUvBx/eIxiW/dW1cRy3ud1HqS/zJsrJqAJxRTlsyr2Ivfbvd+PAJjNew0JW7QfQP2ixCx0ZVBxTsfzTKbkoA==@vger.kernel.org
X-Gm-Message-State: AFuF++noe7EAWT9n8+b2/Sg2GksJWam7S9T9MDmAOvRtaIS6d8sbrxUf
	MQCcxEc94c9eRAs7fxe6WibryFeP6XIL0zEweZMD6ZTndHAL37RljnZ/YAG5JZKpEakv2pb7xJj
	UAo8nTwCvWzNQq4jFhYKfdIKUDGPZ1nQZK8pmrZ04w0070ri2xrx+vgIcqC+ZKZ+4tw==
X-Gm-Gg: AYBFou1009dkDkYL8tLVXD7zx7y+pNjyg6atPSdFGn8lZho0EvYJ915uo3W0vWHmcX3
	EZp9HxEcO3dlmPua4sluVZe08f9AuqAUwqQdwO/9WmCnJIta/QS8HCCtn148i66RAGIMnUhrImE
	Hj9uAAq8gK+9A3k+LwFqGWughlsak3j84KwCZbx0R7Bb3sAOG0deoyGGJqLUN99es5BV8u0qWv8
	TVjFWPPRIPBkt8tOIhfQAoqx7R4mJ1SFliZwXt+0+Ecd1vHdzMleT5NfsrV8bKTfm8TuIIdZW4A
	XdO7FoKri9JkXQ7QNKmnbKUis8Tvy+sLmJWldkGcOEoCfBOtZBm6hOC7bTDU5OezDZsWFtLe4LJ
	SaDFntsv7crIekaMbmrt1QA==
X-Received: by 2002:a4a:e205:0:b0:6c7:76c8:1a6d with SMTP id 006d021491bc7-6ca971e9d72mr10228121eaf.0.1790078623790;
        Tue, 22 Sep 2026 05:03:43 -0700 (PDT)
X-Received: by 2002:a4a:e205:0:b0:6c7:76c8:1a6d with SMTP id 006d021491bc7-6ca971e9d72mr10228055eaf.0.1790078623189;
        Tue, 22 Sep 2026 05:03:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9f1895ddsm54692066b.9.2026.09.22.05.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:03:42 -0700 (PDT)
Message-ID: <69636cb8-5867-42db-a8fb-aa8b2d9301e2@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:03:39 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add
 the embedded controller
To: Oleg Keri <okerixx@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org
References: <20260921144953.15113-1-okerixx@gmail.com>
 <20260921144953.15113-4-okerixx@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921144953.15113-4-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: riZlBIoaGemHNFd8HIKmAEX6WbyZj30P
X-Proofpoint-GUID: riZlBIoaGemHNFd8HIKmAEX6WbyZj30P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3NCBTYWx0ZWRfX8G201NJA1YCE
 E6rV8L6woHj2WvmQPeW5AFI0PbIzj7OoMsvBqZySRF0nW+ORx4ziXiSy2owcS8b9Gg54Uyqd5lY
 JKu87SomFEaDgUj0+zDhoeE0x1r8P9kHbUFY6HCAX7MIXWNPNheJ9ZCxe/Cf9xVC2Oa0Ju4C+97
 yhPphwd6LMAwB4rcjfSBFovksZ4QJTIpfpuaDYQjE/X+0iBtTKoq9ipV/YyNqdBN7plUS9/+ZFm
 rPySYVCjcoIhaYAYeIL8TnSJwhi2H4QGxWJat34Vts4FSpuYgyAY2nfrTtp12d4jsl80XE4V+qq
 j1TIN7hLpjB+4QlKZW9PVJ4+No3QHZDRJiO3O9TUvISljPR9RuG3JXS1+MoZxLuCuVEi1BEfrmx
 DV4A1u6inbrHEbl+zFzYL6WFUcJTjM1XZXy9qKKA5258X1Ub4YjeU2VHdsWf8dmmX2sDr/G1S2I
 dJ4eCGXP/D+EqtJtBhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3NCBTYWx0ZWRfX9RiL6Ep16Esd
 c335CNLwfqqBz04SjtcP9LupxA+uMJHg20PcF+F+hDZDb0VsFJtVFK/1eSkWxQWUlBpRnKNjbk2
 bhteVnhrs2TiygN+mUHCc6IgzzbHVjI=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab26ea0 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=cXQzEVsWzZF_LJZYrIMA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220174

On 9/21/26 4:49 PM, Oleg Keri wrote:
> Describe the Compal embedded controller on I2C at address 0x70. It
> provides the board thermistors, the battery cell voltages and the CPU fan
> speed, and drives the keyboard backlight. Its interrupt line is TLMM
> gpio66, falling edge, for which the file already carries a pin state.
> 
> That state leaves the pin without a bias. gpio66 has no external pull
> and floats when the EC is not driving it, which shows up as a steady
> stream of spurious edges; the vendor ACPI tables describe the same pin
> as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.
> 
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
