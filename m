Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045A3522EE9
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688045; cv=none; b=TjAcDjXM4aMT2ImoqJc48rCm1AheBEia8QMSuULjYoZHbQMux30pUKzkvCzY/vKMUhIwsnaOgkVVfbUGckCz1/T4TT4pmGiZhlCDUxz8r/njUl+YN1EX0FnJPVN1Cr+kojXh6ddwSoaYm8BTuvYmv6KAdp277k86WmsoSuGoF/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688045; c=relaxed/simple;
	bh=O0ihVgcmW96N31WjaekfKFoFrDNfaoWUpnrojK/kPIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTraayoq/w2Q1RkWbNx06CfTgaZdPv4W2eST68Yf7vq8FHFV2vfaSm3lMIobgmej6O0v+C1IZLpWR6zZZhx9zZCvHCGhggxZqecfC308YEmb2pnnlnXn11soDXiq1+qrYn7KhW2A3xCkPFT3tUrWJ/xRr3sV6OrtPxZa+2KTc7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+Uuq0gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExIiVKHj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+Uuq0gh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExIiVKHj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqlGO350194
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M2SaWLLt3k31dyNE7WFRzNl2
	f9XMQ7VloVYpaAtanfM=; b=V+Uuq0ghWlHXxC/cS6ZROX+vjP3BZfTZKEB0TEvj
	GcTNivb2V6exptb2l+M2RvdmxVPQjM4G+8QePtIZlZS34qs+k1zsEwFg2655uP2G
	xJA64+hFb9I4NN35uFhmb4y1KNhllDHTfdaoOQNl1MXLutbltgUoiNk38CIWnoPg
	+wvv6irWZrF5FleeP3Ao0ZVVNlF3KE5TsPFK5SjH1VBsV+hQSnrsi6O3vlBq9LaU
	mLIOE0kN9jMgyrfcHv9haPdsUQQke1m/eeVl0cm/ZG+T49bKC0H9X30oHZwctmNR
	BUG+ys8of2MACreFfhvVRivrrvd+qMV7nY2FjzVtgCSGlA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkk03t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:20:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b2e69f3023so2911649137.2
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688042; x=1791292842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=ExIiVKHjCszga+qt1vSukR3CXZcAwJbS81GxhUD0S4aAuuDqzMos/h5OkitjhYvs2p
         USel3uw4diFBqD7aMu17nFAQzkRKFRepSjANVJzH8VU25E4J7UBALXTBxCX1pDWJfnSk
         ia8ha5JhoY+lTIbXxG3eem9YZ+8oNKJzIPahEm2wH/JnP6uaF43Bm//kcGthfIvcK7EZ
         1NJfVWzhqgL6zo+L4mpvUZhxHjRq6BLx4/esJjFbzrraLbdImVbyJUqTFgkMykvCudTp
         YUa+SSChCPxUJtk9p4+ndlt2WwQcPDLp29Or+jqapwtBQfVMJpVY2NiK/z8jOYV7c7hv
         jhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688042; x=1791292842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=DZsNajX2HWlrxqXfFEqoyd1UHjilxHVXQDbnfLC8uBnYJYhQx59QJdHQAgHJac3TgK
         mzpTKE1nldoIrQc8jw/5n3WMn4luI64oq8sjHeqH4+UwlP8odVeNrS8Ms9zF5mO/tZ2l
         US/QIEGtDfv9+y7JlRUfF7TQoPZ6H7NyS56dNmnNZstktxNUGYzjngfQ6OzoabfpoQD/
         rhsNUWlvN1tgloGX6+omRzwttvy1kNkLEc5ld3px2P9eqUuaCDphTMuQ/IGrmPh33ptb
         mls9Zq7dGqoZT8H1m7F6WO5Ui8ruuqVCNuie3BNMjLHq/AR4jNS985RdPKU0DdTiP4NK
         wBVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbORQOUPW8FbLLBQ+vVwSaWpLKCrah7ogd5dfyb6POTqyvgP13HqS4L+fHo7ylkHm8qL6h8qJie+ZRmg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIDcC2W+1lNkQ9z0ckwvmO+yHipgitiQCd44SkVnTrBQ21Tv+HC
	k2uXwukHriCoBe4saSghVgrOjzRAzFx/tzSNHrBwE8VqaO4IOXeXKqB1Yj2P4Q+G/vVq5Bzhpb4
	u81iKvViEh4YBg9YQ11mh/j8fliTT9l+OKUrD98rq/F0RohOeRQUjSKWU5FLPf+46Kw==
X-Gm-Gg: AYBFou1qI3+2DDEkkSz3y25cTV5EXC2WwL5FKG/UdPA3hjo84SzBqFdskwSLmWgXQbL
	lBSVxuZurdCWEKYkNo9Ho4S1DMFPR0Xl4fcEITfbRzXtBO7zBxUctYo7+GXSktdtTf2tJ3mKdIH
	QdXOmUAQEOVBj8KfvPyOM8dutdAVOAa5mLtVq56KDo/3/Z9pYbYVeJaqfSUypYF/xlJpqG6ZEzC
	LJwB5EBsy1QILete3FRYooN/zHN4TxCYd1NPrK00LJHjMIXIcP+BbW+2wKgQ9V91l6CLJvrdcaT
	B0kYQSCTLUVPiOGJ1wEIC3H1SpSfbEMz5jOKR6L0wdbKi9L5/dhomXE/i0OEZlQ8+x57zLkbeR2
	eD++NSaoxNRaLaNs=
X-Received: by 2002:a05:6102:570d:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7af1f0f34admr6061162137.32.1790688042247;
        Tue, 29 Sep 2026 06:20:42 -0700 (PDT)
X-Received: by 2002:a05:6102:570d:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7af1f0f34admr6061142137.32.1790688041617;
        Tue, 29 Sep 2026 06:20:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfae123sm85417285e9.13.2026.09.29.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:20:40 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:20:38 +0300
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
Message-ID: <bjtvryroi4ckhhlhllaarccyf34uxllmfqwt4jzchtrhwqnuub@7vuypzfxbf76>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX443iZyzCykOP
 RqfdCJAHNHBmPbtj6vTqW4D3ScUCqAC9BWuxAPQGR7WrRMJIhIonNtjXRB2y0Gra7wS3TTGpfRm
 OUjFzSh3RRBFkNzJx9bQY7nmnmopMigsVU8b9yrXu2p4pZ9Q2RI5QuG2xiT7UAn3NvH7cazvu25
 o03E8CM96ddrRJ9ndW8Ym7RcRNUze4cPPwwYfnK2WiCeqGxw6aaF99N8ZG6gUhjREMV882PQUls
 WXmiH/cRvUUOLSZ7VfM+mAHIugn4dG2W9lnQN9PzpNeflUUEmyIQDgXIIWb9wOkYaoaWorl7dLO
 2Ro8JI4+vSLU6cwSLsf8TDkxwOTHaO6PFvkhekUDgEV9qYm3Wd89kRtqbzbNTAbLMTLMyrCCKd/
 S/HKW23pD5YnA+wkaLna/B5NCSENCNT2iUp4Twl1xkdFcA4krs3D2JOzUBbX+4Kfsw3W2cb26TK
 +so6wWV3aTof3DC5Cew==
X-Proofpoint-GUID: D7kQK3SpgGbZ9IY9M4qRvo_Pi5aYldP-
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abbbb2a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zUvQE7La0P2yE5F2ZKYA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: D7kQK3SpgGbZ9IY9M4qRvo_Pi5aYldP-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX+Df18berUFIM
 XtPTRVP9R7FdvVA5vwbPQGZNrCU+F1bTeQp97TzIhgEBzzkX9p1uln/rWi3ZRQmJxF3GcSCSiBW
 /cZfGxVSyKUYKkJSszikBU4zspL14yE=
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
