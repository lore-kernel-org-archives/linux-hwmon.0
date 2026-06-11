Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9732D3A7F75
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 20:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209664; cv=none; b=DoL2K43ZFEtcHIn83AAfRdHq2U4Wdt8pQP4TUUm7A5C3yeRair6suqHiwK7WUFtkEV3V0cfoxyFHwhaiuWWwRNxQVyOpzzQ5w9OUk93rgDzrl/34Uzknh6hoGilbvgHUW9Cbcy432VSHZbm9aqhwI2tJ4HPdvw/rWvuMW73eBRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209664; c=relaxed/simple;
	bh=qk3lT3olDBBLokiRR2lO7JyOH7ODkiiWpCLirs3Cqb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLEigl4Lk08lhpOxq6Wg/LFTodXwLNIPW7ZOwl8LJcLzdzg6eVsGKRssvaf4pgR3CGcT7vQFdH7BdsjujGwhjjgbfO9gUZ9aF2CtHFSxRoJA2/01uy8A6Xu6tNVuqMbqn/piu26O+iHF9SN3xfij3j/mvLnL6+9UiS2svaHpPWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e61j/WiX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJoU1gVy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e61j/WiX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJoU1gVy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3Em81526481
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 20:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wj06zXyDmvIwudcWq/amFKW9
	T7c/rNpW6WT3H/BxWHk=; b=e61j/WiXDqo48wdSrw1+vlefafJpV4HEgMuNyGe/
	BvpGA6tTKsx3aMhAtNXxnoFxQuoy/8f7OZt+cDe0ES1hn95LncnqK9WWY2VPh6Kg
	RUJaxlzaLbYKjMDqZRNYJrak7n+mf5HzEtpjClyUxJlAuGKFN+5lH3eZZ0KkafDn
	cO2Jg60r+VSESbFtBYiQcmD9BVrHMVk1DxDrdsU6jzdtROFtVg2Svfb4opS7JWSr
	OHxKqUD007jJ6ECa3VbV9zRGzg5fV0KL3VXfpD9dw/uwSw7EfT4KEpPTcIMJ3Qnm
	VSkBWVojWYcSb2xvYHBaoydaP1DWiLA4JSJAKRiIUuGTsg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29urexr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 20:27:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51768072950so2413641cf.1
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 13:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209662; x=1781814462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wj06zXyDmvIwudcWq/amFKW9T7c/rNpW6WT3H/BxWHk=;
        b=bJoU1gVyT005qE0RX37zTVC7O/K0BzTZONDyVwwveV2YlXG7JKPDNVN+JvF3ZTz2pc
         Hl4CQVA746VT6sDiqIMwKJZHKQzPXzFJUgw6RCpBTT2VaQBGnTVvU6r7m5dLC8t+RlPn
         wPRDwf4e7JD8AeWvlGBG7XhU35sC6iaqxtvhJ4O+gZsjzy00tf/h3Z9x4Ew4N2u/UxrM
         z+D/ghhtcNBFKie88gEw0Uty95PBmGXZ45toc4QPUOtIhoEjCG2DQ/X1lFOiQS57GdOV
         GWHFD+r6+Avi773Kvdq/uF0ziGDHYLpUW0A8oNMQkwTICM2cB+myEDbrTllozTMxONg1
         eBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209662; x=1781814462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wj06zXyDmvIwudcWq/amFKW9T7c/rNpW6WT3H/BxWHk=;
        b=l+UcNGBAjhBe+n17W2PanLvPWnkNJqcUluiEt576K59493uNb/pla+sKFfo9s+4ITH
         wkPuRaZRBgjTud3HLRSf4WZKT/ujlj3xvXbKBE1M5hlarI2UzriL+jNCYTa3slY2Ns9H
         sV6QF6axLQUZPzaa8HPEsHhkI/ct5yU3hFH+tuyTnjroKkeNbHF8RCBvFAqvpCGpaLt1
         WIiQj1l0rC1WhD5it8tmJRC6OzsIoXKmveqbdsc57m6hYZyHHjO0OIutZtE4MdShYI4V
         srRoOcc8TEqmSTluncf4elD0l/HZJpHOXE5qI0jWUrQCx5j7QUSUbzmJlxt+KIL4J+DB
         GwMg==
X-Forwarded-Encrypted: i=1; AFNElJ/w5/7cVspf42lzL6kwNVL40/6PjnCNCg1FBpiczQM5B4ZOZ3z2Sjwu927XxpuVhkdRnzecJsfqNaXJfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3t1NsXRebyAsnGe7n8mCR6nB+SNMCSXCbQu+z+cK6ZHjpOIGd
	5dGnQHG4KNJ/Wcwr45iTRHDmnG3i1XCaTKPFeSaOYEzB66HZMIUHZhIiN3Sl/+aj//GYR+/VL3z
	hT+Tqqj1VNGtgvK60/5jlsBosbgGyue0xAUl+vAQjXT09RLDXOgoyVgfmiBnzGmQlaw==
X-Gm-Gg: Acq92OE5sl8A/3xwdqxfifireMZLdhXqnpaOT1gpVhMGMNRsPOpeFA8kHDRhJlaPqVf
	60PBVYXNpwP6PnrPaJniVjYNwtiU+0TXMDQLSkuQ176JNn7DKL2KQBzKXI7RN7ivCO4qcwnh9o6
	YH/LKt8i8osedTobw3a/EIIb7PEnBn7K3zIVHQUfic7BT7uZNdtt/KAtZTp9QKGk5i0y77cgc1c
	bPTfNmKfnM4pkbW89sUIyuheL+OSxFWatyiVgYJQR0MZ70XXTTrzviLLewUQe3D37AUD9q3W17L
	eI7Oyozw/aGl4oLBo9vmwtIAGBrTrxhY8fGL+OH2WggDTvckC+UL1m8qp77H1MdUQ7bl2jbLYga
	T+AdTwQ3PkTEHSqNq8gw4E5BBsAw5OSAezsdRjsKK++ujE/w8aYRCq9YDoPFKvQq4LN0C1IV4eK
	v1StFo7FhctJuxnQABOxFUOtOoiepgsgQrnyM=
X-Received: by 2002:a05:622a:28b:b0:517:a9ef:ce3c with SMTP id d75a77b69052e-517ede505c5mr69204251cf.24.1781209661828;
        Thu, 11 Jun 2026 13:27:41 -0700 (PDT)
X-Received: by 2002:a05:622a:28b:b0:517:a9ef:ce3c with SMTP id d75a77b69052e-517ede505c5mr69203861cf.24.1781209661412;
        Thu, 11 Jun 2026 13:27:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cb3ea19sm126223e87.18.2026.06.11.13.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:27:40 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:27:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Martino Facchin <m.facchin@arduino.cc>
Subject: Re: [PATCH v2 2/3] hwmon: ina2xx: support ina232
Message-ID: <zdb5uxiwny434mkz3jmllgy6iivlspslycjxpiz4otqvwpdpvg@rpofwue2zmbn>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
 <20260611-monza-ina232-v2-2-e4375ce652d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-monza-ina232-v2-2-e4375ce652d0@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNSBTYWx0ZWRfX/w8/tAfj5X70
 cAhuR2urUvfv9QQ1BJMYLleKdRuCx28NGx1U2f37+dI/oyDp3nIAvG13efygMuYo1z5fGJM259Z
 Ii/Ug2atylloW5k6i2eBWGkQvksgF/w=
X-Proofpoint-GUID: BTbtINysPHIQzl5BHh3MUzes15bVOEsU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNSBTYWx0ZWRfX5CBoupeiZ5zG
 eotiJ2spKVjnyOODzKqMMqB7JdjqALCxFJt0e/c8KMrbgPS1k/02uCxLXCKh2w0FREkPCWBwwu+
 p2xZ3XwnFEvHNY9V21/FuEUNyRjALzJLGgyGA9Psmbz7CedysxUj/HUVBqQbZg3+ff5mdP1mny3
 ZYgLVPUSZt3phBByanjKp9qI5+gLAGTD6syI5BPu9ucO1KmeJjX5qErdU2WQnMHDmWg5M1JqRbn
 sUaaRnCbizAjazQkUCEHfwUuAJib6SB7DfF9Zo+/Gg5qqPzKbpxsFAFOXeCOoYAb+ZYuF12J5OI
 2K/TP3VfGnUZSYfH1rumzJsr+GHhSAninwYQofgPUJqb0beHP1p5RfVMCB8m/lWaeQ38kfR7+0g
 ey5CGgj2izdIxkLsxwh3eyBZkoBuB/dwhiZsQfpB+lIcdGwcL1vJ+SPbUVWVT6NlqpxLuh2S8D/
 9QJu+DZwBK0YskVMPNw==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2b1a3e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=WU7lJWFF_htWD4kKYEAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: BTbtINysPHIQzl5BHh3MUzes15bVOEsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110205

On Thu, Jun 11, 2026 at 04:05:25PM +0200, Loic Poulain wrote:
> From: Martino Facchin <m.facchin@arduino.cc>
> 
> The INA232 is a current/power monitor. It shares the same register
> layout as the INA2xx and uses the INA226 default configuration, but
> differs in its electrical characteristics:
> 
> Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/hwmon/ina2xx.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
