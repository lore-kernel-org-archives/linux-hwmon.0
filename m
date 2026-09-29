Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F59526A80
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688076; cv=none; b=XyBvfGRwzc0n5QutRyCeNcXlhH5AbgHVtBrYrafd7C4IgC8dsa/6KI0o3fWKQav2GgTgWU5qeaZ1pmqCFsxZKe+8F5rAriGNLp93PBojr8kEc4BHTpZ6zshubeg/bHcb/F9KJgdlOWlUaC31UsVdcDsf7um5yA9YWcY5DLg0pDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688076; c=relaxed/simple;
	bh=3h/ymNXYlxSl9RL5neHs+6kC8pmPpSHO2JHkaaK92w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HW+Jejl5wjVbsfQC7b4lr3+tA9kgGoqObL9syzbrQrfprfpUTUNL3deqgYeDp5dQQs8yTaMYc4okZm01hZTEtswo7vBYIvjAsVjprXoYTGB4AYCWXEOcG7EsdJf/y144OF7BHTbTs/NuogQUbXUMNwiHV6LG/J6sqRiN0wS2f1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aL4/0DBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbOV7l7A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aL4/0DBD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbOV7l7A"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqZQY3936596
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bv8dV17W/c4BxuznKaxP845l
	r+CLIZxBiDhUC0dcTy0=; b=aL4/0DBD4c385VnMkk/tES3H0IUBRk4V5rB5MLoL
	EUzZnUa8lCvqsND0aFQZrIhv1RirCP3RtfmtafD5Q8tTTGLy0kUT54r5dBTAE2eJ
	pdtG9RvL3YgGTmp6omDtkDFXsUzv7wNj3sWuYlNWzHIUSmslMMQVESuTemyz/EsR
	By95bCbOVQXCisNwUbbG2TWLxBjbWcf7opqCMEZ1JeQ4WBjOKKiDJBzOFgOSWloN
	b8tbmhAmMXoQdktNonpfU6z82pIAKUUcGMVoGx/I/LGZzbwfftxck1jKgijEUmwK
	qhUqTCfSAqCy0qZagDB1KNoUNh5yxeWNjM2w9w2KkSnVFw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1gp21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:21:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso956290685a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688072; x=1791292872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bv8dV17W/c4BxuznKaxP845lr+CLIZxBiDhUC0dcTy0=;
        b=YbOV7l7ALsC2IOol7M6eprScU9wp12+QCFhnpobuxn1fC7h8ZplDbuA/hO+31jkM2b
         3/yThjKCwmcUf1GW2fTrSEg8Elk4HpKK8f+W7ek7TdrX3nCeuDRZmagHyU+GxnZdj2Q1
         TWXn3DyJdICFeGpfK9ej1wsAqI/iCOQcpwn58Cp08yB1ty0vZQHCYzSeT7Gz/zG9+RY5
         MG3JfCj/mJVjQv8IHAcKs311KLqug305W4SCfgvPapqF3BY0ltDqnfgVtbp/EDu98Zsn
         LTR6yC9ZMOsdt5V00byAQFB400cg9o3VVS/bqPSgoNiSdYkrj0+sSF6qVFxe0KMIjNt2
         z6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688072; x=1791292872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bv8dV17W/c4BxuznKaxP845lr+CLIZxBiDhUC0dcTy0=;
        b=ChN1NCOdqR+1Kby8F1RF4ddoBfBQ2OTIJbt2MxZmLPNy2kDY5slX5lZ4G5zZqAeaPo
         n7Jv1eRTDmKh7Ny2NyKUBl8+YezZgdoBdqgGiim6AVVlTF/DSzSDzt83VMjOVZgDQVMv
         +osEIZ/tPk80pdTIoMMitNTCFsPp8w6tnUPd1HahQLGlluY8y147waChGuaRuY8usou4
         6XDjrC+xmgrFxn/Lc/LM3hPzj1FZkLs24Q5HbmRssUkQ77bC6/Kt8hXThazM4j8NFk+P
         KyqLa6WuvdqY/JNFzSAPh+FRaeoQAoUIO4R7jjlSMCjIaBINaPDJQ3lZ6Hlvw/xkOlyU
         HLrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcVFXAfFgi8mf8AtUX/BIiVp8SA6jKW9RfcXrllhxqynLW5XT6A0cXLaXU/DgclvxAe35KJQJnsi7zsg==@vger.kernel.org
X-Gm-Message-State: AFuF++ly4fhL4vm76gZGG95K9rN/c+0byDi1NMu51kb3jxNBiF/GwVt1
	1HaGqPvalnFIyPrdknSQIVQaJ3iE9AOrwV8Xv22j9MkQnlsdSogs9hHlW+j8phUivsLlwl6j2i7
	or17OJSH6sjLAPUCTqSLjKy+XvFKzHg1LFvhgd+TqXknhLNgJeYMxUVH3IRGq6xg4cg==
X-Gm-Gg: AYBFou3WZm3c7Xnz0lGIfPiJlKg19X2J95V4jf0ssevEWFuj6UHnE9wJi2z/Pr1joFE
	ATMRnymT8lniczAK8I9UHe0agfyQLyNvQPnsOVAGreh5SOB9zxogHdWXDnJVamjau3lGRmxxL6+
	DdnfMJp/iXDBc4l6fl2AuOrPMrwbE+gc3WxGBJWgpnRem8j54jFp531ivCPwqkEh/MxZnTKTgUF
	p6fQM8mh9J7JWbvfK5ZWTlxtNc7Xp+FHAkw2d5cnCDIkgNnUyvNpKAoCw7JnkT6vz5k4iFXKkyh
	6rwRiCUoYnF1fleq1/dXpfXyImbnIya+rtLTHw4niTVCgWkDB+l//MTsH8iT2xt7ur2VKqrZ+Ow
	Lyrm/GJmdMNkdWiI=
X-Received: by 2002:a05:620a:1d08:b0:93b:d7a0:d9e1 with SMTP id af79cd13be357-93c43d42a19mr2688509985a.59.1790688071989;
        Tue, 29 Sep 2026 06:21:11 -0700 (PDT)
X-Received: by 2002:a05:620a:1d08:b0:93b:d7a0:d9e1 with SMTP id af79cd13be357-93c43d42a19mr2688500585a.59.1790688071199;
        Tue, 29 Sep 2026 06:21:11 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf2d973sm93403535e9.0.2026.09.29.06.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:21:10 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:21:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
Message-ID: <2k5k4qouibqyynstutn5ffohlti63cblnatvhwjbo2e5vok3ww@yudt5aofkc5o>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-11-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-11-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX7nusZJ6FDOjW
 hS+l3EGe+DAhJbJk/Wj7ccYQW/fFgWvfysSkzFPm0kp+rQItBdwpC3eLzqbZ/MygYOFDHuU3QHB
 MDx4qvSQw6ZyR5uKsQ1h/3Znalx9FkA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX/1TIf+GJ4sI7
 STLVZ+0OZfVka91rl7Oqev4x0pJ5gDK4tgc8695XbpW44vkGRn1CHgEN6AM5lIv//nQCvkAcMcA
 lFsJ76XrNjPv/ND8hizcKoL3/6wu9BveuGlAdroZs2G2GuWUnvU44nkuW/svhywlB4LRt14nsUa
 JrphCRsGHub5nCwbh1/LdLqW3tTxdAmuIxDEZ7VKoVybdooh6sofHDP4P/9uUI1yu7UGpgWi4V8
 2ZZd9a3u6o/bLB07nv2Ms8BmC0CGFiTF/m6ZR8ALy5w1F1cVR4FYFLgEHeqZFEoefKn9XHRLaax
 fmZ/47PWSU0g1BSR5nae0PGPCCavR2xt5qoYd5H1Ilcw3YO5z4ZRfdChq7ibKmcySo6Mxctre7Z
 EgSjQ1zAOxNVol7UOBgNlbGn5ZHKDWBcUXPtRg0EP7LMSJVkMRMhCq86aaIXyAx9wyijCMY4pNk
 xElnwggOyfP5ruQo4TA==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abbbb4a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_ybYkvnUm3iZRZ9voNMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: jt-EszEFOj8PcfHY8Th3Cx55OdRDDOcI
X-Proofpoint-GUID: jt-EszEFOj8PcfHY8Th3Cx55OdRDDOcI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290053

On 26-09-29 18:39:43, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
