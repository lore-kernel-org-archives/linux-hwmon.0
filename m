Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421614;
	b=JC3q/yoc6rrRKc6nvc6sAVVBe9pAMwZp8Wgl2KGTklmPe1/peUvo1RW/gYxintsvR5xq
	 tlvUN+5+zMASVbCv17F/0haacpkeHNuKvDxGQ6lLkYaRH17MEsRD8+Z3iusQxyLelN3L4
	 eo41AHAWqF5+jqORC81qiAsFTgD19Vk/EboW2VJS1sZFw77Rekf2t6HiCN9lhhxyTKbiC
	 ApGXgcb2dNLZc2Ervg8C+tymNVhdLBWk6n7iJR6QmlX2lElv7Ro+UUUYGpPYoj8GnnIj8
	 3+UmwhUYu971yPKWV1sdSCzldvS4Uro605Z7NJ+YfhhLluyNZwsFLBCkqe2tyYeR50Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421614;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
	b=t8ksclI+CWT3Fvo3JFLDLrPJguFLl6+XEq/RiaimRKHzjDYoa98iT+jDREayJjnQfwdM
	 WvkkIqDIQR3sfhH7j63XIevrktpVESJFMF0KYH8inAXmnbdjpl8C+pXYG4URKfc6/27mW
	 Ht+sQQf8ssFRVkM2iDgJt8geIzRXZHcutlwZZnXT1vjJ0/q7SQ8y6tUELzYRSn1BtGbw6
	 nJ74/4Gyme+3vVkt5JWBwqmQkoAZC8FXvTl9DZrLzZ3dBie34Kz6YG7GjQHpiMr0KrxWW
	 ES/aJuYfPwchUPQ6EJRfngfX+fPBsU/gt/lLuD5SGzcFkOAyZXj5WBuyg00Z84KgqHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="P0yGY/me";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YIoAJzoB;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97029606C14A
	for <linux-hwmon.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0yGY/me;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YIoAJzoB
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A12A3F8891
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421614; cv=none; b=tdJHywlT4t9FhCuUXZgFKHntdVuKxFp7OW2eSg+BCAgfACD/58JRiKW6VaBLzaruAemOw3QZIRk+t0dwhGjs0zLJ/PpyNleHnJkv07MUzippvaTusxy3o6sG6sy1mFD6tDid5tWyZpUKDoLHUsKfzwI8K8IStVCtxIQo3etspnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421614; c=relaxed/simple;
	bh=8QzhEza4cmQmxyVPqaeJPOjfbUX18+JD1Hl1uHqCQBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YmTU5s0WaLV4i68EtGKtlbV74uX/eDhjjLRWgNAFlnLMSukdIG93caXzkSaJxowHo2huGMYw8TbfHRvAboQbUQiZNhj/vmYKaOSZXyH/x1iuvTRrIRH31TN6y5S6OdHYcl8Yb+5Dx92Aw/rIE+DFFvwAReW4r38/uBdGpBhjuDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0yGY/me; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIoAJzoB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0VpR2774467
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=; b=P0yGY/meToCkfXMD
	ERJxZldNG/3CN4TYtWvURt+Nj3E71DWN67WF+qoqtKV9jmDIwtOuGSTXHsNVIXZC
	R73aUpsQJPaS6FKVK1j75E1T4zr4eG6zOWWl3KpIIcA8+sZrdeHX7w67lreawtvx
	gAtR3+GpkMogP9gnAmYj7LKxD3GIyQ27V5V4etMPOpG3WC5hHsiZQfwcSfFJpm2S
	u8gdHYJ6vToL1QZirfusd6YW7L1Ap3zydnHU2M38mY9DGhFE+wKnOQpgr+5up8Mf
	tbQ2FtusEFlkKqRY4bXw2toI3frV+js12w+cqlk3bZrZ9DFKjeMzbsMNPigx4tRp
	yRsswg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur3bf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:53:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb1091fffso20613585a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 07:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421610; x=1793026410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=YIoAJzoBzAZOEr7tRnwcN5WijY4FhiRXcslGi0gyCMKMOoRxOs5jNGj9y/BE1j/6Rm
         DmbLjXtG3UNgA5AyKV8c+liIwgahwZqJjfTXDPKLE3MSA5LmvEujgPuxbngPqNs70W42
         PWQqaW17ILJ02BJ8220hXbVlqQAbreauniOoyEUByafJ8vqGhud041H9qy9ojOrwNZvU
         uVjGGIXABvjf1yUqX31FkFd5UTgdHDYji2pUrVmVZ0WS3gtyz5oDobMmwZJwXMysSYPm
         VMBdTE7ZQPftA6QOCaLSb+CWw2TPWQp2IedDOG3FGRU11ejYwztFWctnrB865eTUwDV7
         xrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421610; x=1793026410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=fo6Cc+Cqsx75QyvzQ04FEMoSmh58TbBHLnw28Gdf4SAnNWFet5lzmUBebCnX90WMen
         VaVmpRscOUkHKIqnTZGdsm618I5LM6jC7ZmbJMp612PbFXy7Sj0HwbZKbIQwpxmB5hzs
         1cA6bVkmD5LRE3okVOQbtGf29v4KFf8o4CJvH2uu6/+ii2aTv+hpVgm8wqAogRSIl0G0
         hrAZ0IsVuiDMYN9dkIp+6YA1250eCt2Lz83mZh1yWP3d3CbMwXCJWPQimFZ0IcxNk+96
         mUKpW4vjjpDUCNYZsSc4C2itVVWL6OEx3kxGlxdfejceJokvKPDsNklXlFwz4Wpqx95+
         NUmg==
X-Gm-Message-State: AFq9FYImY6T1u3TLekeF7Onb1FDhkMJnpkizy/B6rCWXJf3zS1uuq8ru
	NBYgTUsk9U9sq1LsDsLs8XVGprAg4rVG1A8fMiYb5GuLBhV2BIYJ86QJcZs3X39AyNiAmBXaIqe
	bjk9GduAKaudrt9p3V7wcqerLyzB/Z/4n0DFHhaMjrputkWMjuHOM/4Aeo4nnpyEb0w==
X-Gm-Gg: AYBFou0Lbd+5CYTx5agUe7oFXUZPeDVgSB0ACduC5wle0QJb1dbCsPlc/z6jv0wU04R
	LvNf999AgMeBXtDEsb2VLb91LPpvT5Kh5tF4WDizpLm1mamNVbhFZIpy5tcAtJq+9Rs5aBMfM2X
	2uZ7ojRl3jkrq2wyzQq1UdMDZlGU+bWyWtWAL4OFmxT0rA/rElFgf5yC+KK9jCdb6IWqCds5VVN
	42QH/1x2jkr4vr49tzwkLhgSFFtu7zTkEVVtZHIneC96iTwrT+xskAJfdA3nlKq/aQZ+W9+8GLd
	XTag4K9n8A0VaImLOT1xwpKywzm0DYIlHRc0yKc7qWccAYO3oiW9ia7JAQ0rw/osv7lmZIpI3Fh
	+qwwCSSNE8NpS+sSkF5NxUA==
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1470501785a.6.1792421610313;
        Mon, 19 Oct 2026 07:53:30 -0700 (PDT)
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1470495285a.6.1792421609756;
        Mon, 19 Oct 2026 07:53:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:28 -0700 (PDT)
Message-ID: <2d491ab1-b7b3-42db-8302-5adf4d1a48fa@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:26 +0200
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
Subject: Re: [PATCH v4 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
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
 <20261005-qcom-bcl-hwmon-v4-10-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-10-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX9xemSOKw7SyH
 Qh/YOPPK0EkM9hGSNZk0ZCIDqyc7VCtOU4t49JuTrcx1UZgRlpeqrzw0YrMGp0cEt0dQjCpWd1e
 DAVPmuM9en2ukLoAnuIRSHfO3zByAbw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX+8O2IT3P7UDf
 UfOfM9Eni6bwG1sBP4OORqPExrhQbHRlMk86KcqfEuR0zPiQkNNPbWUUnoDmSU36mktfYGEjUNF
 fAmO+Hgp4tJV6LZvi6tKHg9ZFjbCzFw4HA/pQuaz6Kb9ukBkAoD7pxpDN2vwqFaQzPBlhEptoUu
 2k6wYQMnxm+G1RK8UG8ANcteXMmy1pDZgUZdc8YWYC9YcN44aoXMli0GuESwMofY/PSH8CmAtvl
 5nxNKwtQIGwU2PifdC4RJo6kIN8NTLZDflpjmoZSj8b2iV7eNmZ5RbwubRPtqtevQZdm+j151nZ
 l6e9gwJzvi8zcKYzMLsrCiS1XPaHSJ6vF9wp3IUA1PIJLREwN4lphefWGbGB6apbO4cdCMso53c
 eNWKH2mYU30PJbHHk7qn5N2lGpqCT9yn7ue9JxvF/91dLjIstYtn4kV4QUOmGK1mAfiD3RF5LSU
 7ac1z0GckKUZe0ahh9Q==
X-Proofpoint-ORIG-GUID: _WjOpEeDueYLFAHo8IVkRXYiYq3kbSy5
X-Proofpoint-GUID: _WjOpEeDueYLFAHo8IVkRXYiYq3kbSy5
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad62eeb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_ybYkvnUm3iZRZ9voNMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
