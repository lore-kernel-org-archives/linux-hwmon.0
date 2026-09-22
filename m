Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F0040B105
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 20:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109094; cv=none; b=Xem0nM/MF+W16y9PcXAJm9nTioUT1vkUcLXxNjfTqGhw+R7qU8jdMlqrkF7YxzqwX1M8b9mOuorSvTaidEWnd1pKM8h9CvCukKaGmiwc4p+Kym5pIBPrqDPym1pDNDMUGxVduKWSyvgD1XZXjP7QaLQgHiqQ0PdPm0N0oiIfmuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109094; c=relaxed/simple;
	bh=2SILvg0NRELw7Nyp8PHvnzfGtHVKPwkLNhQMISSJheE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwq0sFK1ieJlTobUdt4gQswlByyujYSgepEDd8nhGHyztwux/p6a8WHFc2zM+4kS1B8+u4gAc63Sg/IGz7tKK62gXIly+4BFp/pb9atrldJOxjAlnb4eoVen4bObFK8WY/eJHxGgJXVkybCxjCtV/FDO1sYwlH+rwoeRcqy739U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MunD8rhl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6aqTgn+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MunD8rhl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E6aqTgn+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI76kf1348909
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 20:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SOdGFJHM+QY3bQbQemDVAYpt
	gztbGbVsScvPY9HEk50=; b=MunD8rhlSUsNocyd9LcmWUU/fdjKDNQZi3JSA/uS
	Mcp91FoVAlQPLsCNC8zYbmOSBlvVbp03jkwp9aMDlYiJtHIidZRtIjd6J/QZEZCu
	6VjLa8JUUGMdGERs4toWO/ptXkr5aXaidp25cBCKU6zHXcbgVI3qBIMc4YWcLq8Q
	atLCS3kNqg6Hu9WKINFaIdJfda7fc4mPtrECZF/n+5N7pIrnrPWS5jfXppFHHshB
	5k3d5akJKIQhi4Hwe9w4YlMefpyovbmy5/ClBBXzWNRWbu28GzRQlEeNFOzNnt9F
	8TS06L4gsxqPCfGTFVqlgm6W3EiYgKN/kNyLI7GNxq6I4A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux860x2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 20:31:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78830f4bebaso101943137.0
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 13:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109080; x=1790713880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SOdGFJHM+QY3bQbQemDVAYptgztbGbVsScvPY9HEk50=;
        b=E6aqTgn+C4ON8LM5Njs+KvJ99+mFGsXuLJZY+gNg35SNgNPIuGOxgCabiIH1Uo8ogH
         3cb1nKnLp3HqhSjB2ZaAzrfT7DkijrzDArSN+QG0zB8ixR2+1BACXWQwjCoE5oI1ni01
         2mbLXsSM7GP30yfszHjfCdD9Inxr3vKbTaIqoHwZ6iE4wezuWxQWIUpjYO5nuoRqCO70
         uWF6Rwuv8uj+UpaFOyqeidAXF29Xk6oRmRV6LVKZRS1Ph9Rq08cFobRApEltvreE10L9
         3zLB5gI++kxx4U3Li/I0wcc1fZ0FOATIJ1IEVr1J9U2C6sSk6ZobovJkZdo2oSSHoM2x
         4Bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109080; x=1790713880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOdGFJHM+QY3bQbQemDVAYptgztbGbVsScvPY9HEk50=;
        b=GowwLlOcUl3canuYmmae98YC/GDdXURFxWkCNJqLycfeZ7t6KbGFfgl0y9ykAPmxxT
         LWaHMQjnP7tnle0mHEQd2zUB6VLSU+IS65uNSvHIGElRmIYkHtKY8oqTESJB2Mog6/M4
         1FNCLjC7UgBrWI+hLBxCkNGqZRbLLgfQb6Y1xLOSKaFXk/191NTawp13rbLphnaiTg+7
         PHV3FyGvvqnG70wyFOqYztkDvWO7yG0k0W8fRgQ3H74pKCXjapWaEgHFuSObPFMs31f1
         aqsDD8AtmlloglSHOBW6hbaNa5Mf3civZIzV0B/a9Be3wvdKxW6XtA03hUlioukdU/0M
         I1zg==
X-Forwarded-Encrypted: i=1; AKwUvBx+FUm2jKcS9x1GSE4GYxIKKfCI9tAO/iYrxxPLU5nWIsPN9om6WGLvpag0ueWGdNlHiy9u+msQLz1YWw==@vger.kernel.org
X-Gm-Message-State: AFuF++naKi16tpOzDzQVAEAsV0KLnuNzMe5FEwHQnpfYd04DUrTe3JOh
	MUMSse5CLOzEVox16gxwmfXxNogwp7yyyAWux/+00AZRSSJJ+nzs0bXgc3gbp7kMHh9mFQjwgVZ
	XWMcI6do7AxclFeU2AycdCj1c6dh1hAt3xxvfm9H5UgQzao+e2W9+2D2IWpoI/0VEzg==
X-Gm-Gg: AYBFou2E6AU7wR2q80lJOTcLUy2Ev3p5/qiJJW3ZltZTq/tElnVetG6slwuoZK3kdUK
	xgM6txq4onueCyWcuXsr0eVpDqCapO+FHsFkttRlRa2aWLbSwCjUXpmt5i/PPK/OuWz8PeJiotF
	bPUMLZuOmRrmvvkXIzQXrtWuhFG84Nz5ozH8xZOJ0UhZA58/Ew0Rh9t5rLEmjGNPaGw77slSZwF
	1c6vZ5TweMb1uBs1LmqD465ZAX3moYpsvOsp7HHDd+PhklePkpmq5awKB56+CNC5QLQxKs+odA2
	Rk9qitf1QBGSkyQoUZIFS1J5ZX6zEcfZITL1C60d4RZBGMfSyr7q9IRwf+VZo3BiMkQpCgvmXHX
	LY3AAtRCGngXe+B48WJ1nC3YEUg==
X-Received: by 2002:a05:6102:511f:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7ac1b625004mr630610137.11.1790109079835;
        Tue, 22 Sep 2026 13:31:19 -0700 (PDT)
X-Received: by 2002:a05:6102:511f:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7ac1b625004mr630541137.11.1790109079268;
        Tue, 22 Sep 2026 13:31:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf99df60sm5738655e9.1.2026.09.22.13.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:31:18 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:31:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add
 Embedded Controller
Message-ID: <uv52rxc6llmlas45mejbeeriryiozh3v2f2itbvfzo4f2sgazm@ly37763jkftd>
References: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
 <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
X-Proofpoint-GUID: Oe9oqbyrfbeB3a9Qwglc-6mQsIDBZU8p
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX7FBwyS+BVq3B
 +V7KGxb9O4FgSC/VF8tYIZLDbnKtKrfmtGx7zPyttoMyuHYf0Jd6kWckKVm7QVWvkam+Fdql79C
 /cb8QV3i2GuKH5wIqN4mMaJNN8zpkiI=
X-Proofpoint-ORIG-GUID: Oe9oqbyrfbeB3a9Qwglc-6mQsIDBZU8p
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab2e598 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=B_ILVBOIu_Z04Xi5GswA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX+VTbdLCm7hgM
 Awo4rC5hJNnaO1JqslBlxRt/N7JDwrlVoTfoJrZCs22C92MXePCmGtjgeDfWhaBTDWRy1Vfs13w
 5vBxfAiMpm5ZqTzBS0jOSnfYlKwFs8BI3Zix1Gv4WpHvKOevBYlsJC2O35iYG2RUobIbq4vOeKs
 a944TLQ95+bsVGMZ7W2sT/c/rbHfA/cXj/bWlLOpSPXO+/CTDGCM8YjfAFf/pk4+yXg10BxftwO
 l/7LN9BFwAXleJvDXmaF6G64IH0VtvwuDomeKgDkEoLQCvh8C5xW2b9WBGEN4gCEMWXIdmO0eik
 ZUP79adkS2r/dumcpJ+0L/MFw7xpjOhZdnB6wv040PTuxGGbxNmTwtsHJ0ZZIAAfu8uvChOG3UO
 LQ9U4XwHGH8q7LBRaYBMkcWZuhp/xowV6vM0461hLAvp3av76iwZp8wW9vNe1I4PiLnDA8CNJhn
 lihOx3Bo0oQR6UYAZYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

On 26-09-22 11:33:38, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
> 
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> index 40433dc2d6cf..d3356fcd25f0 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> @@ -670,8 +670,19 @@ &i2c9 {
>  
>  	status = "okay";
>  
> -	/* EC subdevice @ 0x5b */

So what is on this address then ?

Anyway, LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
