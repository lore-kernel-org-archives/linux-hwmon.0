Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B33526AB8
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687960; cv=none; b=mSggYVgkPlS17GofE7rwBEyGeW1IGUj5n4g81teGpkKuoUOfwzRFrTJeyYC6e68AYe0/j36hc8WGXuLLVfi+OSwb9s9SAQKP70FEL237NPQHlXte0A+gRHab5MNb/nGClrnuFnJHBNtIHqQ4JyN6OhOpIusSWv4hPYY7iJOr0qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687960; c=relaxed/simple;
	bh=32Y3KM5bCP1SDuaXQ/j9zM68Tajy2ksHRzCJwpZJBxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKG3QkJkgLvDaNu7yZbrhxhmZO6zwZ3PI12t3FZ9R3frVuHRCCMVGX3ZsnUWw1CZhBQepZ7sZruBZwAnabJFUnJjqAA5yq82pO6wafsFgZ7r2CYgC7S6UTwZlhx65R3kMO+uo8EEPVDiR5LH2hNEk5HoUaAInvBNRysyZWCsUCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpPaViXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjOfv7Lv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpPaViXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BjOfv7Lv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqerK3842772
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2T5RkWVrZxsjtjTmZsWjGyBA
	n0522HCwfBHwVcNib0U=; b=OpPaViXGEgW04crH61xZymXkMSy7UodlkTejfqOm
	D2DzzS236z4RZxyjZFD1yY97g6+NJG1C8spSIZ0HJY7sV2ocFiV93DZ00h2LtiYy
	LdPkTiHRtxfOw+Hd7IoGzaubLuysCacMnVVfNYXLwdC3qzMYWHLkEEehl4dtlX7A
	8XbDLbeNunYLH4zqIhVr1xcS8FELJIlsGw/I0O1uJCh56w1690DTUou3yzi8RW5a
	NJXKdRqUhQoVOLkTvthQ39Kxmq02GxLoJej4c5Y25XnMojQ2qnY0WvpabbtUVVaf
	ZPxGWmRFiVqor8BwMAPrx24ah1KCu+/xZM4rR6k21CjLeA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0v8v0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:19:17 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b34a3d1f9eso682486137.1
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687957; x=1791292757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2T5RkWVrZxsjtjTmZsWjGyBAn0522HCwfBHwVcNib0U=;
        b=BjOfv7LvLzD9OeaI+VQ1PnYt/kOUrUNWOhMOQIIDem1JpYZSegta3GUssQXEhHtdnT
         ilOAHgYRVrZGSSwDgFUC93xciFs5akgBhQOEmBpR9E+apOZsADUvFglr6HeYwbDvWcaM
         ngUWZtHOak3GZPYEhGEGEcbi1RfajfqnJYZDcvnRnzBxCuHAWbsHdolTzEAVsb3583L6
         DRR9rGiDCKkOcuvJMZHtxoZxYXeZJjo9MjcuMBe1j8zbs6CUqGHFIP3LrKKaVtEbvbYr
         ZOhZk96UE6uwC/eevV3MHNfWcpm/AyT/o8u/L6N5N/LJjhzJzSwuD6BN4Mi3omZAFAzk
         70gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687957; x=1791292757;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2T5RkWVrZxsjtjTmZsWjGyBAn0522HCwfBHwVcNib0U=;
        b=blGTmX2bmKWM39I9c1LYI6hGdGgtXAt4v3G2U7Oio/MXlAY25a0zj6U0cj7yPm4E2s
         1UhsaaFCUmt6BeEroGj3Cp3sux5/XaR3K1nmE/g2SCCj2OKY59oKAG8lj1kqfY5jeiKH
         EozFQ+qRnoFkgIl/Ny1MO9HWuRnvRqdVLXlHTC6GDtOQWPdL5pBTrZx2NjH74CIoZaXJ
         wTSO/SSYFL1SPyKvtsRMXhgNMqotQw2b+hBAV1O+mfBv1gplsAmc9zvNGWVth0k6eMai
         5Wm3lKFWxr550A6Bik0JwWsgN9C1o2jHO4/NTgiFLzXB81hsG5t7JS3n0S5UJtbyqIFe
         f/KQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeW3vaZ2WG3s54EBIq+vyi1gEU9sbC6+8xZHCOyhbXWCGkJs7ITLgUHTQ33K4d99hlIy18pHv8qvnMIA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPuPo9LS20o7GLCaMhqLOcIrnizr5XgnOc9Ej0l5Ccg7IQLG0R
	gjVYkHSunDu4iYrnf0MDiLzwdUXkyD7JYO635B3FwsIiqiNAG8Kxz1+nU+1gnsAxGxHgGUV0cRX
	rNhFE1fLaGOU9CquXI6OmHDOxvAX79kvPD2GwfHVIkXv4aia4TW9qe0NTBikBNjgHGg==
X-Gm-Gg: AYBFou2rsNqZhdJa3XowFrUjr/rWkvTwAcQ2yRBqHUvHV9c0wYL+p+pmoaSjBRUynME
	X56p/YCoQ8OaTxfjPdL4DxtWz7ReWKd0ZBtAX2N56oW+PwJmKV3nlQtwiuaMwGxTxYBQd1Kt5FU
	0zJRJ06B06mHhinHOvVCHEeX+Fl5vAVx3Rs+zunYQx/L/RKoRWWJ3pH+huepwoO9flIqffztrr8
	jjrbW78it5EIRe0o29ln+1cQhWOx1Bj66B3+G7SNrMKPwjZG0epf6kA81SysZ2vtIeGlrqorvLJ
	7Y8TqiDzVmHoaaxWr1v4fpJx30a78LwUFQq3h/iS2SQ7ZkrSRgecEVRYDFjStuDuCfIFA7W2ZZb
	rbawQBFhdfKuicdI=
X-Received: by 2002:a05:6102:5714:b0:7b2:9b08:7e24 with SMTP id ada2fe7eead31-7b29b088957mr2999245137.34.1790687956510;
        Tue, 29 Sep 2026 06:19:16 -0700 (PDT)
X-Received: by 2002:a05:6102:5714:b0:7b2:9b08:7e24 with SMTP id ada2fe7eead31-7b29b088957mr2999222137.34.1790687955697;
        Tue, 29 Sep 2026 06:19:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013d00570sm3501885e9.3.2026.09.29.06.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:19:15 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:19:13 +0300
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
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
Message-ID: <3ic47ak3t6zeac77r7tq2oeovmy26mh6kieyssinv7nm2dmzzj@33zfyfxga56g>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: h1YzzR7a5OUv8k0NKmlFJU28wGUeJJ6n
X-Proofpoint-GUID: h1YzzR7a5OUv8k0NKmlFJU28wGUeJJ6n
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abbbad5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=X6Y4kDKz15hUnpVYhMEA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfXzDKuRP9fSG0Q
 n9PyQ+qMWHYCOfEOOGtrxOPEDqaWGl1BjQl4fIwMwFBoVg5/V5BjQV2d5W8C6IiL07vljYkn3WB
 +Dz27scATvlgxzEe2uGF7Hed5TjJyo5xmgnBzPBTPXOFFJUmqZlnYBFZABNopD1fnD90cxMUd/Y
 bolUTsLxhfjpLc759ScCKEpEeh+c0tyt4taH5YE0R/VwsG0OFhKLT/n4wsjLUABkBQkhSPEFlEz
 NuSYFjTvvP5MCCc7zXrb9ffdDh6zw8oRABhf7PFhUwCPIcRS0Kz9M62OVZb3rh1favafjqwATmE
 uxN3iygo7vqVD1mKToPVnuCQfA1uyWf1SVnwqU0ZY1zD9+WzrVknqyXzwvg/ea/0EZekvpzB+JR
 KipU/r4HsuSJoo5lxBuWxt7J6CHWk6ddxHnX9DKRgLhdjksP26YAHsZP5kF+Kya4itFkGkauur3
 eHylkc+kCK18xzjga/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfXyJOf5jnNILp/
 YH/2cDlj1B8ry+DisWLMJXHkSKR+XWJiS/tRw8ak3b0JU1MsVwMkiAmEgYy/itmt84rfSTEDQJi
 +ZWCi4lTKGNIYNvqJUpzIOdtZD3mjek=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290053

On 26-09-29 18:39:40, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8550
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
