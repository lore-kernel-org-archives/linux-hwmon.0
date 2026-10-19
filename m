Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421607;
	b=FhCvZM4LY45QxCBzVek7QF4uzx09oXxzFJFxInLDBay72ygaw5pmEz+k2V+vBEdHYpQu
	 d0nxoE3AP5c3ijW2LOjnlH8HZgOFE8Qg/saYJ70kcT1bT58/GKUnhIKj5jzgz3bUb973i
	 vRP0mWoj3LnldPxrQwBXW+zSVVLvlIqG6cFD8IDn9vBhSaMjyaYDtBeKyirj3+rSNN5Ec
	 MB5S+o2nLMRpkemeP1t1Ff4DUVVrQEH/ToqGvs0HhsQk+mOcZhf3ojtalAiPfNHFObEt1
	 XqP5TgMbCLB9TqWqp2vs9o6Inj0gQda4BYvvkftjN50gHogNbgHJ8ISpX/AVpYbGmtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421607;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=;
	b=ZhAA6O9XrP5hmX7rZn2ECPSIVcV7OUjnNJL0DStaYfKEcBndmlbWnZrdLtCNO/ztIukA
	 V62dvjUt4rzVwkgDNmNSAIgYoKsCyTAY6R4XdbtLECKMPEoCDMN/n2XXQO26og9bV27mF
	 wIVXvDAZqaG7lndyyzLY8opseXGYaVECccINBVhnz45jU62SqZRTOuH/zAj0aGj/pBzu9
	 tOxf5fLbb51g2qb3iplVG5co5cUS13Lo5w6ESAlLabjJoRnm7g1XJ0rsBIJlg7NhkaRhj
	 NzXUjyUnvU9gsBchpSSHQEUm8lmGBdSEQ7XzN/E81JePCPUso0pIA89GnR7Z5M7irhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KLH+1rr4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fK5FitJr;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE94606AAF7
	for <linux-hwmon.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KLH+1rr4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fK5FitJr
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DE34C8473
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421606; cv=none; b=gwKVN/IaPzYJWevGnzQ2rQAT7F0cefD8TOwZ9ko8tk9zOg+1DdQyXfzeKwNkwva0slhtpVzNNFDmYHt+TMF3HfsDOKUsgYAZsDe5AgGmC2h4OT0ORRxqhWNtnkQaRWnoB1iRiNxUNssvkngWacHU4PXj1htnacQiTuPTCGFA1bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421606; c=relaxed/simple;
	bh=G/kjWIzcC3oPmLS9q/TvtvOucNt1bc2bS8JpSzIl0VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwlSqxtzH5e+cjEuMEbR1sR6cwzhwuWkJvnfBpL3Pp74yyjQQdU0rrbjR+tdKTWggO/q2jI+4OGengcPChsWIDV76A4t+7vLXc3DI6+bIsuAqzhtd/AFYhphoNBG1O00xyC8Ojr2zJt/BnxyUckSYCaIZlSMEV6cFOa6NoKFEXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLH+1rr4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fK5FitJr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0T1I2774407
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=; b=KLH+1rr4147Ms2AB
	6RqJrPWDDnYZaWNnrObaXTkZWdce6WgGf6dwdf6RZJtvMRpbVtBALjuHhqez/t/L
	v8+NZMdpck17lxe7YVHLcTUw+Mkbt7C9y81Sk0iD+f0W2Gmh3r8Jshw76A8WF1FB
	Kn47TPuRTlogof/oaPOCXBa/emBdA+DOFFgbmozdUmg2dP4AeBNrIZNsJWfvdqik
	/wt9Mn8ITAibwrQ4B6NrUG24PbXqX8OrDeMABHn39MEK4IN7XztTXoeu611n2uPj
	me2URMHEocYcKfGrpgsczO8CYyA14KL+GIQH0P3warigUQpDt6zrCc+jeFzhDGxA
	XUE8ZQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur3ben-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179ef12a03so10620246d6.1
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 07:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421604; x=1793026404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=;
        b=fK5FitJr8MRY8YX1lZ/LDMRb1kP7hWJ7g5WV58vkZk5HiGA6mZUaDUOT3MXJD/xVv5
         i5TkmQOirL9PnpxiuBgA4h2sA5qINyKWUHoWoi3RtzpIYhHWNTjsO5kc3wpcE/pAZFCz
         cJ4npod7S5kYGwFkPZCKg1r4KkQbG4mZBE8eahMqDrN8rUuW4rDz6XV3U1IMkBoKgBgq
         PDLgyZGoe1078C4kb5FeVQunGXEvwSLCtXj1PIyasuP5MjGRpWxa9yCdlBzNA+miETs3
         yRDVMzKeI7fgOEQV5DFvGeCQiUo9eHOLvx/0Oa6PmBE3BrzdHTWBEmFmPElcIKalV8CK
         oR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421604; x=1793026404;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=;
        b=pEBCdjKCANIL+P5GKxgLw3lE7LKcJtU6gtsfuzLo7Xo7GRHBLRAtZxUlXB3ETG+/VQ
         2KUVpdgCleOlxvT6l/tdiZyUkUYShMDDb0WYwxhDoeN3srQq4iJg5x9vyuiuj1YqPxic
         XwKU0rbDIB+n1LWYTbGv7KWoBLCBoy9A3joyBh11ajtAI9iN3sxeAZS+puq1pvW3TmOU
         RC24YDXSo81rNJ02JeYP7O4zlojToXEX8FYHBh6NCKZ1zO07Uw86ajBN4Eug/13w1IRU
         0ogvPUCjmKkVH68qzUN+k/pMN9ANnAULB9M07eWDlBK4giSMKU7jBZJ5ULPsbNdCILFH
         GFbA==
X-Gm-Message-State: AFq9FYL4k4z4BWPshlhWikwSCThHVHLcODmR9O+LuWVLQ+A6qAvCDD2+
	toGNoKa7LyEdhxbObx1Ir4PppO6HUucIuekpeAwcTatUcWSmoj4B0kkCCNpRoYKk7zkqb1vYQBS
	F10RBx6e/5OUFGkVF9tOd3wbzjIjfdeMssf0TQFExsHA1u6mLK4i4+AgNb9ohIiaevw==
X-Gm-Gg: AYBFou2cOVWW34KJLymoYZEcNfRo+kxgg7fAJTn/oCF2ndGZiEZkLS8yEIr437Waq1x
	48hzlpyarNlt0hsLvrOTShUzGHsWFoF79w0lT+zs8zsAt4KaFdJg18r72S6jLuHKGktg1Hfc1Ee
	LyNVlFHyNaOp3Ke7YJyr/JN3Z7fYx4f5atmDMvsCLr4Tz4SalhHgmYCVfqPRTvwQqLT1D+L0gTJ
	XOgA1+9+eW94qpc5Sx+rLQ9ooohUsVLw4aTHijuispdUzpCtFxnnjss8O+z8C/klkiavefCKXJl
	B0JsKWXKMcRY8mg/lqLb9uK0GWt8iq6zMDOULNedI245CSAxGto2VRnRkeUqBOOCUjRQl0o3FeA
	V065zWv0gpA4T/18VXaRnmA==
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1426526885a.0.1792421604001;
        Mon, 19 Oct 2026 07:53:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1426519485a.0.1792421603076;
        Mon, 19 Oct 2026 07:53:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:22 -0700 (PDT)
Message-ID: <11592f75-bf83-43eb-ad51-ab3aa77df0a6@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:20 +0200
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor
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
 <20261005-qcom-bcl-hwmon-v4-9-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-9-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX/b1jXJNdAfh2
 kM4fHhp6VZTjOvbRqGbfrZHEeoqoooeGPcG8xOP/FvVhm50XEycVLevjOeoTF8EduQjQm41N8RS
 Up/8CKhlsEMmbTtFMzjvXsTKYbKS5Is=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX/d+20OS3Fo55
 F6rxhajpHKEdMbQ5R61O6KJ72Ibt1MzT12FMTSMo36pw/7PGfQL78Ru1LH4E4Qu2jRqm8NBOSwY
 pahBtl2J1q4nXlqZdPfu/7EXbHX6yxNGG+YJELGbsdcsDE7HyrvvoEbFxD0t9M2wiNIcO9xsV6J
 dAhOwyYlps6hd5pa0/WW1664EgHTVZEkxG7wKp03ME4mF8NnAoRlWk2747FYq8cf72NaTUYXEzG
 vcmNnbumzASgltJVrY6fuVaOXf7aoBrNPPr+D6BkcBWv3orkTLfqsXCGDGVen2pxPB6YoojdfI+
 dQUIsFaD6q1PmjXnYVg9wBbkV7nGmT51Vf01/PmFWy4qzBBNFc4OQJanFk/Xsqj5lMJ4Mxn+A9C
 WsojRlunMxyybjEutmQh/cXRB35EZHSK66VBGFRt2Bbf39b4ApZmepNc+hBspvFOnvrAemTlMBL
 +JIyE3OcVxRtjjez2tw==
X-Proofpoint-ORIG-GUID: OAN9Rb4S09KWKSJACNBqO0wpM5aQWdX3
X-Proofpoint-GUID: OAN9Rb4S09KWKSJACNBqO0wpM5aQWdX3
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad62ee4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zUvQE7La0P2yE5F2ZKYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
