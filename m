Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E047738DC6E
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687987; cv=none; b=Ughwn+rmBCy+BXCgZOS30lvl5X7KcfwMsvhhppQhLIFyfotbqeGRm9wQNS7AMjE7KXaszK4EbpjQMTDdFGc1SVgDYDb1xw4l8l+JvKe7RSIWu/ly4OjDCF3H26U4hu2zGFiYW/PvT2R8obg6HWByeqAuZLHJ6UoezEbbTA+o8Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687987; c=relaxed/simple;
	bh=O0ihVgcmW96N31WjaekfKFoFrDNfaoWUpnrojK/kPIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gta/7sVsoFCpkrbStqEGCDZJGR5zJkrrBN7z3KWdJrSS/sN910Ko/WNLt+ruFaMXg7HhZEIbmrMZr5JHQoC8kQM+Fd+qUsp5d/yZXSV7bw3/1DnCwRwXSXqRD8Pgu6tPDUoxHmfqiEcYv1QwLKAE0L6BtBdOaGafkF4jrJV/8gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlHzN4oq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayPriXCe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlHzN4oq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayPriXCe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqlGG350194
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M2SaWLLt3k31dyNE7WFRzNl2
	f9XMQ7VloVYpaAtanfM=; b=TlHzN4oqB/ezUHQHeXfCDFgi4nzSCw28zqyr8Qt6
	U3fYQZPuXk+FID/DS6lX0cxOVWvZneMpq3aTdYlof3Dz2EfjaPLS1KcEGderFqG0
	AXFZ71yDrrIvur7qAOKFJQIOGEleTV74HfbrxC+nKTTTmUoudDKU/HSuChUd7H+C
	8NildQB+6oDGiiPWOAt5VguE9cg2BUXlSxoU8ZIRWAF+pAAtybVDNUoHHa0iG335
	J14wx6trFoDgdCfDwXj6N4lNuLWx9e6ir34mNOOROFCN5HqUTytwb1eHD6StS3dp
	F2aTHtNwlbzeUUPQXRl5VO/9owlc3ePVoml5Pc1fUIx3OA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkk00b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:19:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b7da952536so1626318137.3
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687984; x=1791292784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=ayPriXCe0M+jTnOXo3hKHwTf1Dl1XzrBvcNeHyHTBiHJD7RmclbWYtWNWe4qIIBqWl
         icjD3qdfVcqMGvX14139zDYHy6/BdLVGO7LeQu57+0sG/LiWDOMIVM6LeMSm/rxC4PIn
         PVb55sxp8bDX3tnedPKNkmHh7jQKLTqRX2H/Q8XMrLxv0ViHvISnHLbE9NKUEo2vPsup
         692yKBBt+cTVPnyO5ciEz0ZGCXvL0TjFYfkVR33LBvxwug+BdCGTCPwTzHiDEKJdQFVE
         vGwdpkXLHTGrT+9PnbfEczhGGttZVZ4GKeDAdp+Bohdp/r76DtIBCzyINJPmFmNAVdyw
         s2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687984; x=1791292784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=SbY9ObIgvcbV7zNII7ajbGFOQHoTpH/DB0E8qVS6vX8tEw8AD9vvokcn9pNCmOEWkU
         DoL6lDHVexHZXSuMDLliVfRxdTsCSosqOiKGlP+OhtKfsRzoqMWmw7JlX58sOQVti5lu
         IkvdwZnxKKOH3wHTZYUnz0fThb4PgnnvTW8iBOFlf3YQDcY3xvff0lh8qz1IGoQ6UBOo
         uCQBg+ywNI06a7EJFapHLF5znFkScSjPA07l8fxygORvFMQ9t49sE01tP2WCD6bo5oda
         iA7H2ONSvhPX735UdFNFOPofZZS0ek6mY2+Zi/W3zkk7vfBmcTCUFcOLSQ4d5oCVM/eA
         +8uQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSbENYlt1ll/63S2gG0SstUsp2U/2nD5gaVxL8p1Dtec2w48FzF7YaRnc4JGm40nYk8En8obSfBu0lCA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJL1SqHoE4mQroAfuuHwSMszZ/QVpwSfBzLz5t9wThtPb+x/VuH
	Y3npih7jk587naPHDFnih2PjyEgaSV/LCVO4LHkfw/Njw51pZGHNNus/tkUhVj1LzS1lNhAwjvA
	wzeCuRl1UZVCXoO82ujILKUZ/gR8sorJ8ZzUa1H3tM725Mps/rJTQtM5FYZGnmw5CIA==
X-Gm-Gg: AYBFou15vCf7h6a0Yol3pQfhFkdc3GvDsRRFAo6Dy9MJI3xENEiykd2MQhMgCdhinYl
	CbWOWrdTTC6/WHGA6lQ587fXALx1bgsVNENBVrpX22a3SGVShNU0svUmMKYquS4oweETX+YnYuO
	9V7jHMYFNhmKt5pegQrC0xLwfQa5Fp0abIB3xdidJb1kCweBa19AczJHZhsKGm7p2jCq4V5XmX6
	FgCyp3Dp496JRRR0++DoUhhpeSRv5IPRAsmLRzHlpCvvzE/vroQElLLhwI4tQR79pGnkcCsxNEH
	f8sdbQWDv2mrLElRdRGeJkHBNC74kSoo5fqVcF6Ae0nWgLUrU+SUcOdjyw5PQ/Q67yDrU0Se8yO
	22sFzpCfZmINPfGc=
X-Received: by 2002:a05:6102:84d0:10b0:7b2:43df:ca51 with SMTP id ada2fe7eead31-7b243dfe78fmr2908976137.27.1790687984086;
        Tue, 29 Sep 2026 06:19:44 -0700 (PDT)
X-Received: by 2002:a05:6102:84d0:10b0:7b2:43df:ca51 with SMTP id ada2fe7eead31-7b243dfe78fmr2908970137.27.1790687983594;
        Tue, 29 Sep 2026 06:19:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfecb39sm85112185e9.7.2026.09.29.06.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:19:42 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:19:40 +0300
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
Subject: Re: [PATCH v3 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor
 node
Message-ID: <x7k2cumcciponrgroymvh65r2dqgagxd3gaxgem3di4mcaeriw@njn3rc3jwbbd>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX0G5zkxA8WjZ2
 VUS5PaaEJnfqaasw2brg3cptYFm56DHfiVrntrLALcM7lKfyQiQw8W2WNivEBMzVQSXA1HDdfdH
 JkFKxxpdK+Kv0QJgOnKU6K7/5+c81LTt1Ei2oUCD2l3srkiu8q4Bth6wKhJwof5Cm/S3SpcZL8R
 1i+jSz8i2hJqSN5KpPY8JSSH7E+WElzsGsaNV6uNmpQICGnbEiDvVXaSufn2e9KtkJCx95IQ4Gf
 uxXK9+ZRwkAPbEKOCH8LN645SCnYhpNdMmouIsAWkHNNbWh6UvoBQDYelnRMxpQfhuHaDj9Mpg7
 u2+3EB+yZKWDKI+RhscS6JchVlm4pFaCnGnRFrb+HqorDy23+CnkspJ3uhWrWAGF7+KObKtb8FH
 81qrYB9khSCrWxtkd1T7V+8OHj8gf9VDKZMLn97GwgfzrIWIEDB37qmc2kjM8Lr7GNZjil48V23
 +bqzVc6/CFrEmvDpLcg==
X-Proofpoint-GUID: I7XtdK7rIWubRV4XnK27QLQLszY9Wbk8
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abbbaf0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zUvQE7La0P2yE5F2ZKYA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: I7XtdK7rIWubRV4XnK27QLQLszY9Wbk8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX8d/5AHOxA2aW
 o1PwQ3Byxci3/keW8Iew5rD65DSK0zHP06Na8u9QhBu/NIQWc7JmYELcbTDxmkm0fiSZYUF2+T4
 Tzcy2Ub6rIsNxTC9Ogkc6ZrJ/hNVVsk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290053

On 26-09-29 18:39:41, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
