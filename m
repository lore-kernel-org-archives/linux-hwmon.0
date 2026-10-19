Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421588;
	b=SDPSb/cgWo0MgIKG1ggpNQHvcO46QKp21lLWt6eJK0cZ4Cpq0cFg9+b6P2/tb1m+rEYj
	 Jf+UsHdf1zLXi/3KkpFCUWl90BL9Co8O1QMLZ93fTzECGLuK+ESeTO32oQNR0ksnGDiCG
	 B5Rzpioipqp6/5cm7zYbpLcq7m6a415u+07H4r5VkPgTnJ3iWM7I/2LS5jy9MYe4Arsc7
	 KSAjRMuH3ZyHbi0wDuVGb6sjYKtd/paKR/nuku+hdlyZ+EfzOu+9kV3QfynuahHlbOu9h
	 eWHQfyG2J+qxumlOjLmc2aL3dg6TiLp8AwBrXgcyCNY82babvQO/jCrfGBH711bbJMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421588;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=;
	b=Vw2HxlE3HwwydwKUnvvwYdqU59BzeMI2aO4FRvdEMCwq5vfm8qsX2sje7hdMiNEAZm6b
	 RcNGDSQCUzx54+fW5tlxfGtUTLlJRdCnZA2XiZvcTxjtNC4ghJKh+slXbfWGWPNvJy4f/
	 wNSHdu/jTwfvPKWAs7MHwVkVyKoorAG6urmziG377KY+fPcdEFppJftFKW+GngdUsnpm9
	 rzpjiU+SR7QwkS1QuQbW99jjEscfIxgMPVBVUxIHa2VYX1lofzLiLPmNTgcSYqlJhhnp4
	 nh+2I12ahMLp5BI91NOE16YFWasIs8FY5/EhH1oY8bIcxE9QTCl8sWGuw9gKW2lX2rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=psM6uTXD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QD5yxaCX;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D21B606AAD6
	for <linux-hwmon.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=psM6uTXD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QD5yxaCX
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3FF4AA01E
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421588; cv=none; b=ePhwAh0TNQ8ROSZEmgsNtK+FqkDkCHBarosuXGnK6EMBoC5EtaQrU6BBrIPGbkb677HvRkTrEt+m0Ga/C6WUdVRvns/1AccyBPjWzMXnsUPzKVdGwJBfL/JUKchIdCsxST4dmheRTYZqbsb8kyEvvl/yr5Ii2LtLMp3+UqUw1o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421588; c=relaxed/simple;
	bh=hQxPdpCxBDIx+pPny6Aea4SoTc4k93a/FzzUSZ3WShE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cv5AL6hYqEoAmdgyxxhlE3Qch/4JDWwiR5GRpUu2u/VN/5WpDM7LTu4o8tgci/csYyOU4el70i2UkqwR6xc75pm7KY3558NHisN99IZupJVLmOW/h/ZAd9DL4KwK7FxnkUm/ewkvzjNXmb2lpCZudeux2ju7AoYgKeFG+upoHCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psM6uTXD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QD5yxaCX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0Tbs2774392
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=; b=psM6uTXDiOcUQQSw
	38e20UwanrY0K1ltAHo8MCrCV4Yl/CwRpA7KZpClrR4IsQz7MmZg0hp6BYQLSieo
	sazVRX5eJ/6TR0RJZdUbv+dbhwBRV6VXbSEK3VwbxZqz6CkQdI4J2DK4Uff/4JZU
	GQipnG+/JbP5N01RvuhPceAsl5+3JmjhWACD9HSeTWPPEYFKjT/RHaXUiD+4SQEh
	ciR5uTbP14DltWM/gSHDzG0G2lpWTT0u1x2m9avgQQQaODuvSwg0CmmdD8z6Jw2g
	fQZnEOclohYRFDRVqnkNt5xUSm5xYDPznjEmjZg//9OxuKmy48eoFoL6dtOvPuRX
	W3G/5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur3bdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so85483085a.2
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 07:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421585; x=1793026385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=;
        b=QD5yxaCXEfhjEw3uZmOoFcMuh58hpKkt+4emq3kmI5J0CknBjsFdMp2GvAlf0Sx/2V
         z0c9aSOOn+nfzTIak6wyxhr6/0yRoaqL+XJnUo4ev5Lqub9ntjpeMyPAL50ADE5LFm4J
         t9rwlJVW3+i5B9W5VchA3aUyr9J+bDusnXBjtrYVaP29XPQPAm0XHYHHAMxukJhrF1mz
         JeKviAPjSJ+oTfrlsqVGP6lArg/3Gf6bk31qiATt16/ewUb4ovmr882EgMxMlH+8QwWH
         VQVsg9QJgvGoWMnKR46+qmZ4GPT98kPhDyUis+2s67RIUHZWp/gsX2yl4AdvMh3U1Au+
         iRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421585; x=1793026385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=;
        b=GlIyqzDlC/vbc1MM9rouRG6dw0MxSeHK2xAvMt72/1RrmYfIyrTVXt0lCC/dQj+TOb
         R/2PRVuS+yokF0P1CVLgD3EcNj6gyX863TSeEvWDnpbqANoFT1kJuLh0CuMgvJnV+lui
         yG1yTDaav+PXJAA/HRfB5AcFSAKInBNOYGfz2bt2HiQukgJMADXYcsN2bF30pgAkrJIs
         18UoS5Fbr6II3iQbC/RQ8Q55GdWcZtGf/m5swrRBfMP8LkexEKzZDbL1C0VSi6FN30nL
         qu2twmKZ48bSyrb1HrxkLpPcu1Ly6K2SwaWdNMXGJGuRDaMGFKtgqd6p7ojZZ2JZifH3
         wVyA==
X-Gm-Message-State: AFq9FYIsj1woSuomkcFBqBbLVwz/35SLpjEye8Aqeddh0H9wOUn1x+tT
	P04j6HUO9nQA6wGpvgt2AFVQvLqaKL0okDo3KeMX5mw7uoVE3ME7ZD88DaHOrpDIiaQDxjYQnsd
	9SzEzm0yTrcgX2n2AYfr8eUo3Bi4WEe1EOOAedI5cnkli2tjaYG8puWkzn4NP+xP7yQ==
X-Gm-Gg: AYBFou1pUftg+tB7qVISDAmp/NC3PkEe5bMzIe6gwLC1YNI0dv+rTlCQTd+pPTOYv9y
	DmgDrbwpdDQcIHzzYubPSE1aNAn23J69FZ7XgoTlons8FBq26+VCACvDjrzgk4MVOjUU6X5QRg7
	DSRjhWL8RfU1vV8RvYcbrAy3KfAW6j/5rmovjkuW/LaabxxCoVQwuGcwoH4IJjFlM8fkUt4uY3N
	cqprnnXoOo8eJ6HMcCYD/BqVWCWSSMkMsC93krcu7Rm0YZH3jUuKBrgvg25nKFiIJ6w7Rv55ygF
	aZWbzjUKsFCl8BiUUaD0qR8A0j/B/ciKRJc8QyRzCJlBC9e7eByyl3gSQbaK932Nop0MlbmRFIM
	Ek0T1N4/2xWM5F+oftoCyMw==
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547531685a.5.1792421585132;
        Mon, 19 Oct 2026 07:53:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547525285a.5.1792421584507;
        Mon, 19 Oct 2026 07:53:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380967066b.11.2026.10.19.07.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:03 -0700 (PDT)
Message-ID: <c142bbde-a556-4ffa-b005-d12779fbcef2@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:01 +0200
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
Subject: Re: [PATCH v4 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor
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
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-7-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-7-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX5vsgV/AgJEhQ
 fYibkzJ7Me96uni4Ju9v5YyG8+d1BqPzwhP3/w6IiHF9s3K+PjKOCn0Uqh4uJDURA+md/ONRya7
 SVFIzm0apheqM86BPI3GMICeKmIIU0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX3qpq0Dj/2YGr
 I7co9R4QIP9kXTW/OipEix1kbw6JHg/jW0FhfPhWqmYx8GPSsnygiTlgYydSAniFA/l76Oa93kZ
 0LiodaonT8lPuIBGEmEayWmJ9VptzjsElV8Ml/isbFGyXykt70/wk5hB/uEepv88rWAa6+8WftN
 MMClY8Rc3DsZSckxmzW/DqWsWp1rxttq06m757xmJY/ET38hDhX9qxb8ssfENzQrqYmEA7TQO2p
 Hwh/ljzVi021TuCgYBrYZ+hMeTvBSvAQu5reyYjLxJW/s/HeBsvQYEbcEOMwLh1Dy3lnH1I0+61
 ud9VH6VPlE55gn9Y+zuXlH+OzOMaXEFVxyWyManl9NIqIwibfAt1lvzJeW5G1mQQELTXY0Pr808
 xDcCuLfkJng3o0JhYLPP+XQO+b83ocCW+cMLmo3LkSYDra26VxAdQxz0z/fCNN6Ms0MxthECauA
 ckIr8ofQOeKIBWjKA5g==
X-Proofpoint-ORIG-GUID: WEk2gYwHY_D8WE1ex2KmDFerz0D89iMD
X-Proofpoint-GUID: WEk2gYwHY_D8WE1ex2KmDFerz0D89iMD
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad62ed1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JQL8vk9cGjK8yxBYMiEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
