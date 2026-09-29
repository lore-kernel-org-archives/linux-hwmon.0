Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1FF526A80
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687922; cv=none; b=LXsBZNzCo/6uZSN4k6IBzdeggPodbLa92L5ZBjrJb2ZKTBbY+p8ZbDMUL55N9US8OxfOnzkf91kCrTXwt/mhw4IjUrP7zfwEt8T5R7r0XN6WuGMQjvU4Itjd4aYR9DtxkIf++U0zMh2ygdkiN4Sh9wquxg6OigJbN0qRs1kNPPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687922; c=relaxed/simple;
	bh=RghKvJeq/ErdFxSsLNsy/c0hNkdHN2XDzC+ZRGXIV/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VozQ21LIxkg3PnWv1Z9DJ90l8V9oasNt7qfUeuAog4qQKduBqOPiYjJFK0kHUAZ4IfnW6hJEM3Xxd8ur+pdMDmNnah973qTtHPwZxvo9Y3rMpX0DI/aqhVHuMnK/GeqZ8HMJNXej4C3aQGP9JuEaOgXCifUwGEryNnskF8aH2kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiJ3Ojkj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNmcU8Vi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiJ3Ojkj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNmcU8Vi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqkCr204985
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=acJRYFzUEXib4HZN5FmHHyj1
	2VqTvFrBKT3HaFCEHIs=; b=CiJ3Ojkj0QB/PSzR+k1LrgEN1IfV0teEtppCAz5M
	BIVpvRFx0V9mPObW8fHRfOF/xgmfhWnndMwT0S96DQH5A8hpoEjm2G/CRviO5eJg
	C1iIqLiaULNFiEUUFYP2wuVkjSRAyUbd9EEYV85rDNYcRfY/FZzrSEzP24L6Dt/J
	ND59cZ11AbMkFsjCY+GLuqOGlbBqHLukPauhFqKkapqVYxUc1Bas/1Jj6mxQMtel
	XRt54bdbNJGPiuNM1Y25jCSbaopwK4wIk9kVL2qzErY7pdlYTP8v3GvePY1AV2FO
	fPaoeK6g4WcntlJ338Jkfak4c3oGTaJFRHGe9d4PCbLDHA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144u59t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:18:39 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso3096314241.3
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687919; x=1791292719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=acJRYFzUEXib4HZN5FmHHyj12VqTvFrBKT3HaFCEHIs=;
        b=BNmcU8VimqMy4z//EAWYyekU9aGO5BWzCFR9PTlIHX4sja5QqYsoq/Vma5qSfaWd1n
         Il9Gll+C3qjHFI4pF1lG0C/qn2/+WsUIJviEZJYdP3HSDv8Xzl5vAApsh5PUNj2MiBjQ
         Ygakr79hzky4Voy/aL9LN4hgIsIzBLGwpOLdkpUjT6BB6dDwxwcBqSpG7a5wOP45fyAv
         /dKliVVF1acilpzor5+RkKxg1aEhLTkMjzb8IJomUF5TjqroCvEmWL1BvmuqnJ32Hqvf
         nUlFL/Bdhi+jML93iqClKe2RTmV6k42iZjgzll5YzqpESWNYYs4mSo+661A6wm5DW0jT
         dsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687919; x=1791292719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acJRYFzUEXib4HZN5FmHHyj12VqTvFrBKT3HaFCEHIs=;
        b=Z9awMZOPNc+vhmcAagxo3rz12zKPpvkCloYIPutOuCyzEO6MiBUiVJRhG8Bl2S7B28
         z/qhqD4YgxQN5q24k4aBLI6iZV1VaQlPSs2GCdzH4rcBkVnKWOTSUPt1ZQIQgTEv27mB
         R28g8FtN1XNY5AvZhNVdat6LdKQI+dmFtN1nwt+63ruUubJFHJG7lMZPQmCXxQN5ReMQ
         dppBp6YDMEPG5FPp/bVxH8DBEUQfWh0K/kMo5lXTmwrbxJnTwXneBC+4jZ2/rsXl81g7
         blaWHnS6ZVpBP2GuQKXNPI2WfFnaOMbmfOkrP54+7ZuAgPNTXjrkmB9dasJI0E5UFzCK
         e21A==
X-Forwarded-Encrypted: i=1; AKwUvBxdkqOydllHwwH33fF6Cq0SbCHqBHDvlFxd+2FNDJsjPNxH56NIoONzvEZTRd+zyidR4a7F7UMlLIH/jg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLLBiNL2BQHvb7HoLjgt+UTU8ym2H4Kg3atR6bwX+HC2NJnRw50
	OUBY8idL2cZyDiA5fFPcKGOUwAfpNdOqe0r6tO+Uy+cJMXw7GZZbl/RKiFLioUUEbrwf+Oe0ttr
	bDvWa0h5O4+HeFkPkL9kT1g3rk3iE/CZUZ4eRgsbwbsfuRseXgv3vdV5kzODNiZigcQ==
X-Gm-Gg: AYBFou0U5xQdftMDX4f6PkfMCsAjHZXgvDhU7K+B4qb5n8BcHYyXEYaAt5BKkPt8wlO
	bELSz89CtIH30048CmsYbNhttBVtZmT4zMkivc0Cuxvvgi6k1TDpzUwL0b12MtHQf1WAcLDKNKP
	DZ1exi6B0Kl5kfH7ell/LBQ5Irm04j3tRfWASfi3ZP0W18bVMRd5mU1uTm2sJIpoSepmGNXz5WI
	kFy3WCiFNp03rbVwZXLlKN1DhPPqtYkk0vl6ILnh5b5rYcxHWw4EuqqxzI64X7X782R0bcPTZrE
	l7KFUFyz4rSf0F61fmRxEe3O3Hi5v1Jn+RWW8Sz6ss5zqf9XXkrsl3ZNhjz/TFiQ1Ia7ozRPNFu
	0bZIDKHsrGjZNQDQ=
X-Received: by 2002:a05:6102:5121:b0:7b4:879c:bb8d with SMTP id ada2fe7eead31-7b4879cc104mr2523118137.37.1790687918742;
        Tue, 29 Sep 2026 06:18:38 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:7b4:879c:bb8d with SMTP id ada2fe7eead31-7b4879cc104mr2523103137.37.1790687918083;
        Tue, 29 Sep 2026 06:18:38 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af509658dsm3582704f8f.32.2026.09.29.06.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:18:37 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:18:35 +0300
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
Subject: Re: [PATCH v3 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
Message-ID: <4d44yw35rdxvkvoufiyscumsvzrslgnvzoqpcqs76m3qn53c46@tk4rbs2xal2e>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-6-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-6-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXzl/A5bXtFzK+
 OSUZNG6VNxvdmlblTh2VAY1mhD9A6QiXTa+mCzcrn3jcew9Y+j6IsC2G2DjCM8B2u1RjVgR4BbJ
 l16GXOWOlYxzanPr9y+J5+hObeorofZROeb/rdfggCF9DL2OizTe9y2ejmeGI1b8Som9oaiKU6I
 39l5K5NK+u6gqnYGeLEd1LjxuFU5nWTfSNFvMvW+55WGV+g5SoldIdIwX9kfkBwWMMNDKR9Q0XK
 xC37ogzE3H6TyO7f6wibqyTMrVpW5GKryf0ZBarXF+TcWqGbtitovrpk43A0d8vVZKacDANM2Jt
 xrxXzMGubPDCM20TSeMNKqPl8uVlgLyPynjIkYqVys+7T/RfTNDnme+tHFI2thkLVgnAeTW9+YY
 cE6h5kI4en8ObXuwCwLtPOz6mrTXeYci09h6IEc0figCkGpJ9kWqFAHIMrfV1va+NtCz2g63Xeb
 ub2fWoOuhFAwcXzzXuA==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbbaaf cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: jN5HOqBCsRtk7Dk5BJ5EToPYTFSrupAI
X-Proofpoint-GUID: jN5HOqBCsRtk7Dk5BJ5EToPYTFSrupAI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX4EWfQ+9uu3nu
 lQMo6jSBFJ0mISD9GFTHuR2sU1pjymhUwrxa5KiluA7CtXM0UNPysBm9VVz8RK1vYZZKOWwwozd
 9o1tHvBbFncI++h3FK1ZW1WfU4iRQoU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

On 26-09-29 18:39:38, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550ba-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
