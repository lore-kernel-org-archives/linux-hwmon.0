Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140564FD783
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687894; cv=none; b=RNeqJfSRJ1MHr17HzoMCdzEpCPNdlTI9zWt0dRKsfPVCRfmTHIBaLuzpofbX3Bo+bmiudw1yaj3ueOsbu7p239CwfGMpE746/QxuIRdt37pBy+pYCeYuZzI0426weGaNsxzvUQF1LdvWPqiDWs1V+tb7Rxy1z4R6tmkAl6moCGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687894; c=relaxed/simple;
	bh=zxlynqi9fA8FlivDnTAJLSnkFbzFLM6PTRJzA0vvrQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smB+ZEy9cx6yR5tyqPNrTobTIl0SG97AwJIQ5VWd0XGDJFxUK1/qaWaD4q1F6VoHXo9pB1fp00xgoCovggvlMHVDkQMOvN8lVaPN/LtrKLbJhKiEbU1vbpxExj9/jn9Xk0reFs+UESWEsiba11j/wwTPYFll+taVtjHRbA1E3mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMil+mGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBId9aGv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMil+mGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBId9aGv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqh5x3842806
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7iPBVhcUH178RCfdDLu69SKN
	FsRS6mvhRrQFeu8efrw=; b=KMil+mGseY6xEm7eHWWv6S2XW+SZ5ztlbecdyUKU
	UaOCljx9hInVasq+uOM/H+7U0aXW484crJWmizv8LtQFXd27Qt8JLJuB4wdE5bLW
	Kh1irypBIOpRPddBIkFN8JdUap/kv3c25e/B9cScsM/6ofUt9W9vE+fzWi8NejFF
	rIBex24AlKsDV8prLcUQp6i24ItSc7pewZjRA8WXagr4W43rFnYo248m6boV5/dZ
	ppFmD68bqcga/3icp9430da7AkO9DKvXGdyFWiSgx1iZ7PpDLimil3hpqPqqB3VC
	b/+qDSO2rlXnfoLZvgH4wsVs1RpO0iq3sa9g87B/0kQ8dQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0v8uv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:18:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b335ce0f18so456364137.1
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687891; x=1791292691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7iPBVhcUH178RCfdDLu69SKNFsRS6mvhRrQFeu8efrw=;
        b=HBId9aGvdBby5KTP/ewuNd86FmgOar/L1DERs/n8QLqI5VrRxqoxbsHcfbEAX2ZBh1
         HY2fPiyPle/m7CLWBAqT/qJWbjF/f5KTEXGuYdO3XY6lGtSXPX1gl/M4gdQHNtPN2kuy
         9pA0ovRsZEf+q8YVy4h7ow+o2WWOJMgH1vuzf2o/VOo2BOrjNKNie2OGJbW6wc6jrm3Z
         oc0h53ROKizp4bkfd8ZhqBYzCr5Nyn+q3DM4+7e3Sp7kOLNcSyzcRRX4VH3oumAZl5FW
         7IUQsb4/vECjIvOOXkW8MRYS38YSoJs4E1p7Lh5ybNSJ0KkBIi0Tqh2LEZLBsh1DXVAh
         0AWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687891; x=1791292691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iPBVhcUH178RCfdDLu69SKNFsRS6mvhRrQFeu8efrw=;
        b=cxcMZNiciG9zaacvamlGx2bNnFd2o7OzDHDeR3c+IgXzZnmeff1g5Iu0OAf0qmFwrG
         BoAabeTCzEw3q37y5bF0N8bqATYo2SY0zhNWLMXnl9ldd9Cq6Q1zLS0uPystJQVpLGFV
         rNJ0qwkiM7a1UzreEyfrGWQUFvVacRchERxQ3UbQ1lMIhz5DMQu6Al9cdzUpa3ZZyOLx
         zEPIHVcWDM8SaPRYd0amTvKkN0zk57PHWoVamUZ1ayCgUi/4muL+TKFrwDJcFnOi0SC6
         3+OTuDcojqid68hpzbsDZWrupQIYfL3oiCy+GRsPCdPiMdIHjZp6tijyPPaLIFpTCQTE
         LIwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzy7Pq1IH0gF00mP8CvsjiJ71oX2Vf2nMPpcTT8w14ghDQZwOtDuqIwJua8NKJAYhz+uxltiTYWnFP6vw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIqNoksTreyNw+9khTVWWN2BR81PXxRB1Jc1Sm+qp5Valh6ESr7
	GEbdwf6MNkHbJ8P5UQZvFUhqcjb6O/M+UlhYg78LMunm0iJ2v9ZEsUBOxEiSU+Ak2So+YmsbxTq
	QjVwKKALekickAd6rKsijFCyFm3j9l2FsEEW0X8dDcvsPOG68OPGmEA27RBb0lNWuig==
X-Gm-Gg: AYBFou2NQMkGX7Iu7D6iQ75mRtZBURa3NyMg3PcmYbhG5/xATXWjC1/REWh6BFczrac
	P8LWz3bB4f/k1OGgkeVPDsIhmNJ9IX1gvnWvov7njp3Won7ytgH3o5io2FqV7l32vTXFHEfNfea
	6CCqu+y4EfgAWFEyir3HBhHttOlT5HuBhlH9y8/EnqQXxcCOrCJwEUtIHK7RUubVxctZgMWBLGP
	DD0qNuqmD6LHJGRfG3N6MpF6p2wKigN+WCGoIa76BcxlWHgaRhzw9lXSacRZDCGYvz3pbUXCOak
	HGGYeWmVk3W/u57NA27m9Gitgls4BSQ85ltfjBIurKA9Wo/rma7IdBnwaFxdYK4vkkrR7FNM2w6
	WwYZjwmIxcFfU8fA=
X-Received: by 2002:a05:6102:512b:b0:7b2:7aac:8ccb with SMTP id ada2fe7eead31-7b27aac8dc1mr2849934137.17.1790687890929;
        Tue, 29 Sep 2026 06:18:10 -0700 (PDT)
X-Received: by 2002:a05:6102:512b:b0:7b2:7aac:8ccb with SMTP id ada2fe7eead31-7b27aac8dc1mr2849905137.17.1790687890247;
        Tue, 29 Sep 2026 06:18:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm77089755e9.15.2026.09.29.06.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:18:09 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:18:07 +0300
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
Subject: Re: [PATCH v3 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL
 sensor node
Message-ID: <xttngc5acpc4bj626ekvbjcdwswnh4wjp6yiej6kbwxz7cdcv2@cj7gxywhskep>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-5-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-5-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IldS1gDIWbum0hddKuEpZKsXF1B7nw3M
X-Proofpoint-GUID: IldS1gDIWbum0hddKuEpZKsXF1B7nw3M
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abbba93 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX75hNX2/VVrUj
 JWl4nbc+B5raZ+BqZgic/FGeW48ZyWaBtniEpU9IL9VH5mqj7kpO5kewzlPftpb1BATiIUXQfFF
 iwRimIMsD7R7AMJSipN/vcyCBLT4w6Omn2WI3dAgZTW4t6Na8Uy4pCk/pZTRPUyf8XsNlv3CSpg
 XpoCy8jLnC/zkg4TY9sUMRljXbph1r/3U+7biKGNtMZXLR5gNWkxws41CLNSWd0emgCYfqs4/Z0
 Lc5B1IAbDMmv7meER1kJyDNi8kBbGeEqPpe5M1zf88UiF8Jh33b8IRvvyXaLz0uMa43PnkqNCez
 AqasFvhdRMXYLzi21mgSBNK8lshvKcWmEWFYavvzGOJ0GXDK0VozQyHlfK3yzVQPPXbSLQBEfgA
 P4NpRBM2ECzdR0jWHFRdUFEW5IDEv2gQxxo34+EqyDQQRQq/ErAuzUhpgb/nfvdhEJJCE4mIQqE
 aBCmXZGNuDgee+Rjmuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX0SjkuQP+ikCi
 stnSaGBwb+bj8MXZt88brWmUTDQESrKBLSLXnOcsV6AwN/gR+d+TXF6DHMa70k/nos2eKZHvFG0
 Ppogb+HNbY+klTc251h9LJDDFvKcVqA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

On 26-09-29 18:39:37, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
