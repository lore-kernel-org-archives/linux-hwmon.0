Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFBE3672A0
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 20:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209637; cv=none; b=OVJoEECVw69/h4MYP8wb5ZzaLHsapRYkfmKejEep0zVlewK5G0fWUpVVN6RXeekjB2vc6vlVTMF7q7I4aYnRJhnL8lQlYgV6z0j9zji+P4d8MTbL6hOMCSX0EwFuEvhNj6TXWjQAW0RVSrMfqv2poAbxdJY9UyhJ7Ed0iGsHXfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209637; c=relaxed/simple;
	bh=SNKhpV4UsCOuxobndaMzPRySz5cmpw3LpqlDlwJPfWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sf4QHhniOexISZht5/nx83kGTIeEs0vr4OHl/T5OurefJmyhG3QoqWsP3tdVo2GTaAU1EB+RU6em+os0yh4MqjGj5fd4fgQcwayUwiUqe2HPo3aHx1rTGXF5S9puLa2zrOywlShVZQHdnMBEqOBbUUo60nJlHnds0YTmMUUIGPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtjZFCi+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+wFUiCo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EtjZFCi+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F+wFUiCo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3Q3u1500037
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 20:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fQBF4pKHDzaZb4PUrojp9IHT
	+Wtkkpm3p6FxhUuFZnI=; b=EtjZFCi+YDAbkqtaTOokqjuQgy2XDfvNcDZTasiU
	3lOPPTwDS5nVY8Ci83Tg6GGSApiU0OLe5zNaPZbrNa+TgZgcMtOX15yKPw4hCUAe
	v76QobYwRu/cWg7E/My26Bu5Uqhsryy/yJAuCNLtR8TrnytcKAHQHcEdCaBjj/JE
	con9MGR0r2YbqXXwAjFQlQaxaiVDZoZg2HZpMI0js8Bu69dqO+ImeRziy7QNf5te
	HSfQ2RW6LXfks2guTxX5Os/k3QRto67iGzE1yv/zAJ0ApMlcz/HnD/q3t/Blk1nj
	FW5CuHR/8Lp7ug9XeUFBlYkg7glZwGlBOIlKYApVwVNwzw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r70bdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 20:27:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c89de84f33so228663137.0
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 13:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209634; x=1781814434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fQBF4pKHDzaZb4PUrojp9IHT+Wtkkpm3p6FxhUuFZnI=;
        b=F+wFUiCoCX+7pzWaK5AKHb3dh9WarrdlkgGofjSvd039fZcyrmIZPjEyoIxbzpGPHb
         YDmKpmAI3e5iju5hQmTVO11Ov5laFtICsHn+p/uqzHX/Ptc2VVgJWnPHV6YIOh3cZmTw
         qiJ4vxHqReL/7AdB/PvGf3Bhy5/50/qWodM2qC+jyj/HOul3UPLXFRD1bPmnnIK77Yzs
         Ew6HM5Cm2GguRHcLpIj+w9c+xJ4D9njr0lsIWR2akflj0KPkUrmEZiy6kIdwjIV8fjE2
         XWJ+ebHBT1JK9sWLRinRaNFmiopely3AW4k7fqLT9/VMxOaI1jt40LsxOt3JvWJtzwJT
         uKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209634; x=1781814434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQBF4pKHDzaZb4PUrojp9IHT+Wtkkpm3p6FxhUuFZnI=;
        b=ddTx70zqSN3P576uab2HQ7ppJzEplMKhydiy1NlfQlD/fFjuJud0iNbcmVQJGR/tfG
         YZjpzVWvC0elParbh3IJIMRHalwOHf2XpkFCg/CAJAjkHTlDlIlzMDA3Fwk/N0RR44nc
         qQxkMTNNEIGfSxF1aEwjUrLTex1KaKWEx8H+crf7S6WVm1yQXDAIjV03ieSJTyJ72f2p
         GE3xCfNMxSZe0AKZBQGHotie+Rr4WxjGLFscZnqIwUf42UQk6iG+9khAonZh6fH53/PB
         JLjQWyMUMylSwImI+VMUqzMILrc0YyT4TtMOas4JxXm/03nRJicfFjWAikX5PZcY+3LA
         wWhg==
X-Forwarded-Encrypted: i=1; AFNElJ+Tz0kPF6yJ5lFxL4gMuYKdXXaHOlw/2quX9vACw7G7LNbsXq0CmY4zlP6WJuzQluh7r69wZNPJmekFrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk28Ymlm1mrN4NvweXGfrK1c6KVWuV1C/ewjrotTny0mZmbI9o
	tP00UynA5cK6UFFFJia1MZSxCmkQE+lzZVhYAJhiuENggxgcvKKO9zPe2pyYA82NW6phvAhIpCl
	jRmNLi6vm+tIs4xnC4uW/GRK6jFtBSbJYWEBM26Jf8xAiBYrKluCPVNQ5hu8QQj4LKQ==
X-Gm-Gg: Acq92OGkodm/vy6R8nXD7fAXjw4GVka2/luDLvLld/3MuKPN2fjo1XIRKNmub4rg403
	1cqHnpjyrqT2lEBt5UUZuS+9art8U57vST1bwuiIJrP4UIydmhhtuQN4C9Gmi8zOhW7VSrZDe7L
	nvJhU976b/l17euey1kDQTxrIxbR3kVVpnom+fKTaTZJCjuSU5AStI38jpDt9afVaHd5xkB182/
	vijcu5UYkAvdcP7MWDz+cBR7Amjy3+8gzUsqyP4DmyKDAQhFXswGFMDSkMHkyk7qJQ4ItwZo7Q0
	lGpU6z0WYjwj88OkT3Z3bZCTiwX6Ytl1cpr9QIv/N9L5GTY8dgAiStPekBOkRrK5kAERtXrGWll
	q8KYBPxIG/Qvg9tgIQvKcrDih+/gwAmnpu4gB4rjAKBvLp7PAQw8NWU90lZ4HS9WWQKEzjXErmn
	8482GsfbBevO90pjQFnnQFS0wxyK/JBSDFR48=
X-Received: by 2002:a05:6102:419e:b0:639:1e8b:ecd9 with SMTP id ada2fe7eead31-71d5ca6f14emr3089271137.20.1781209634105;
        Thu, 11 Jun 2026 13:27:14 -0700 (PDT)
X-Received: by 2002:a05:6102:419e:b0:639:1e8b:ecd9 with SMTP id ada2fe7eead31-71d5ca6f14emr3089259137.20.1781209633698;
        Thu, 11 Jun 2026 13:27:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c2ba89sm300791fa.5.2026.06.11.13.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:27:11 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:27:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco-arduino-monza: add
 ina232 power sensor
Message-ID: <dtees6izgdfuiwkfhc36h7h5ybjyuajumsysaig4yucsijtqw2@b3wo3yys5uq5>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
 <20260611-monza-ina232-v2-3-e4375ce652d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-monza-ina232-v2-3-e4375ce652d0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: HS76mz9Ah53vaMJPzFvIcv6roDkNsBIh
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2b1a23 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=F2uzNt_Jvis__oCUEkcA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: HS76mz9Ah53vaMJPzFvIcv6roDkNsBIh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNSBTYWx0ZWRfX4PX8DCiZLXrT
 Pde5Z/v6OJdkFnmrkWX3pfneyaPX5k/3UFr595uxC6qNF9QXrZi5kRO7c3i4q2HPOU11ypho0HH
 vTL6oU/OC0zO8ZchBTinR/dwdKt+9bwYN8uldh+adWbTPVple9rX4WmVg1Hz7/vWvsd+BVdjPdf
 JhjmGBAfXUxGuqEMpXIbmae8QuhtXxD9/DCwaBt/JBasR7CodA/nzKeRxxVQWEiPtxzqdQBLy7K
 Hu6IJ3pL1Z1KGVqRIVVZFKV+oZjwfKq3g/DppKlSYBBXneGIYXKFwYCNeKZti0Nd1ar7Z3Nnpqx
 QcOvMkMU/aWDh6vX0t3ylhGRKU8Z2QZ/K4kN3DDTzzCrEYrWKfV2AS3Hs0nfqdzuOknwvEc2Ze9
 +5oVyQVZ2QPRly4OIVyytwEA0i7rnoH2nzSCpe0Qu048wnPBxuZk60iCmM4hVckhAXddHSyPHLj
 CVoCiCe1eFW3N9LOq4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNSBTYWx0ZWRfXzIjWJqb8jYEV
 lYSP0mOSKSRzZqnJn+/3WZsj1QYEyofCQNDY689UNNBHnvs7zrpn0mGOEfsBdn9m6TNeZrLVgCK
 04eI4hqIT3qV7UlnahBRb/Ly592Vlmg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110205

On Thu, Jun 11, 2026 at 04:05:26PM +0200, Loic Poulain wrote:
> The Arduino Monza board has a TI INA232 current/power monitor connected
> on I2C12 at address 0x40. It is used to measure the board supply current
> through a 2 milliohms shunt resistor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
