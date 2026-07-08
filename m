Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095C6428849
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 11:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511341; cv=none; b=Mb9rILrblQMOvt9x2kKSedZJFyTslz2oCghdPaOndFVft1RgUea9GbN8JpFnqNzvfpecPoL7iit2L4EDAO0c5B1bRbRZHEQoFqU5+00tPr9PJGGGdbfJBL+eyr2CkYx6fmqEZ3SVwVC7iW3uWTfQrji99iQ4j5NPYcEsbFgWBPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511341; c=relaxed/simple;
	bh=sHNn17aKVhqil9DBxff24B4FJq8xh7GOnkVsmOc7GHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCDeKttY8VrzkiZZiOzqn6wqeAv2l5QzS6jqH6tY6IDR8JezEdo0zV3FoduY9Nf4BDkC3/QXs0qDWFj/V/MKcBgFGka58NQeeDJi0u+dbZ7EOx/QZ2tjmLaGz/Qor7HNntoVq+JLECmPnEek4XlM4H1a3UFB+9dV388VXr7V6aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDyq7pFI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATj1KmpR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDyq7pFI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATj1KmpR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BTCTt2681581
	for <linux-hwmon@vger.kernel.org>; Wed, 8 Jul 2026 11:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1mIY3etcMwovdUDflPI4vVznoNrhNzenJIiJ8YOsYw=; b=lDyq7pFIRKhDkYkB
	qWmasX+77IyGngeqrL9KIqj8Pd0+qD7Z8NInZ8paM0c7pIDY00KCxW2hOzmjGN0m
	f21C8RDpi+UhIfChkP/jZqRdZ+38h362bGs8+gEwuvn7+UnHOC8eUTdQI9smd1ra
	MMPyHh2cmCSIKnm8zd/73tAzPsjHdQfebWVoD3h6cUHNan2GFsG3u68b+IWhppt8
	YtsyiV4L+Lf6QJp2TvgQyfT8otg+OX1GfwzcGMjNCcJtYFWyQQJyu8q8wAY4Pgvj
	L/bqvHrCve/TRCHZ60usHNera/zE6InKJA8jp9XgCrFWnoyQCoRZDpYDAEynV2vA
	17bEZQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5v8bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2026 11:48:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso208765137.3
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2026 04:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783511338; x=1784116138; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X1mIY3etcMwovdUDflPI4vVznoNrhNzenJIiJ8YOsYw=;
        b=ATj1KmpRvrX69VjHxrQm8U2ULhY1eYZMaf8lNzJbgAm/sIOXV9j1cZCEdhgchrlkdr
         rUnfLJP/oegK6NJLuLEzABGjDDlSraalB04IP+d/kPdx0nK5w9WA02eMHygUcGqfscp6
         vIKu65Yxu/wVhhA0dCi41zBUuAZ3ALzSzL1G3ZlqG4LgD+AOjZmkDoDz+0GoQ2gDctKz
         fTVjozaXGCumpSZIgrnpRwViSaw+1VxR7jFslptuUat7ADVKksyeI1TZ2OhZ+YcofaMs
         4kMQtg7pde3GhS7yJbUJNJWs1PD3RxzgdnR5ZjK+OGfjFPXWk8Yn8JudlUYMBYoSkUlq
         3GFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783511338; x=1784116138;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X1mIY3etcMwovdUDflPI4vVznoNrhNzenJIiJ8YOsYw=;
        b=dgS/ujNmaqy+eJo81Syb/oaX+VLjpO5iJ5zgsMcLPOCYrmHxSL48vmgL26rv+DOKwS
         4QNUEagsg23lfqcuK+g/4hx2GiepiPLs8MD/5Oz8GFihwdiWb/KTYZjhp/nglqKBsCYv
         SnpG7v7JOeaaF/Ruj9p7jbu2y1O0b7GX72+9lunZ9pgDNgYHpExhxZQBcby4eVwzd5sb
         2eSqM1oFQ5o+UC5QtZp9BtfwsSvR+OefozTpn+Mdp2nBH60SelBzMFV2yi8wjNuDeRy2
         m/FSNeGb3NRvpT8xekf6j+1sXEmeUfDrVogdSNizCPt0sHUPlc/yRtExnub0ZUtw3Hdd
         WZwA==
X-Forwarded-Encrypted: i=1; AHgh+RoKy0s/u1uQ1JMM9OOcKh59z1kp03lHf3fae1jEWr7NcBzKeV4cfTI6s/uIkWc1KW9HNpFSVi0cbplbtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEK30x2+29maaNG4r99BZBuaHrSsc40+4CWTYWrgI3qC+lhSG7
	NKflQTY6lAD8jacbsTptQnhkLXdXT5yts5z62Bncmm/hI15f6xhoVbdOuETDFuWkAuaXc/OK/Sd
	zTk1fCqwZu5/9ud6vTdgZ9yp2sWqeGeilZEZIH9X8cw16aJ6j9Ead52Iq8k3UiJE6SQ==
X-Gm-Gg: AfdE7cklOFwVpFuaX2ZbeTdxXCU34PsxjISALR0QRb9lQ19+49hO/zuSRFrAzgGow7Q
	7bW/khHN5cTsPxF29d8rPfYTz/6oj/c/wHK3remdB84EuY017V8Bv+EjfEgAiiEZQUlRlygM2Qp
	/zk1ePW2GlBL3Eaj7ImM/M02O+RDEWIax09oJMitPJNQ2Tq0XNovVzZgf3E1tiDQeUgnEBEZEFI
	TPLtNZ4JxyVh9mvcuPI+ahmtHdQRuqJfvb5r4r4ttKGUaFhaLrr+TGKwtqYM/Iyeklcy/D/M+PB
	QrtH01ciT8GG3R57yDF1j/hiAgtpeIi79yY1QHw/sluGUDZokBY5DBp4Qp8TYF30P9rrTAiWa0F
	HwwabVyWzDh/nFeRP8nF1hgd+5I4lv5l05V8Y5//agv8xHI5XDCesy726JDA2ElAz7xL7KXTxOb
	yPp0scMPb2eMNw12tVihreToW7
X-Received: by 2002:a05:6102:8001:b0:726:f965:722b with SMTP id ada2fe7eead31-744dfed3969mr959592137.21.1783511338225;
        Wed, 08 Jul 2026 04:48:58 -0700 (PDT)
X-Received: by 2002:a05:6102:8001:b0:726:f965:722b with SMTP id ada2fe7eead31-744dfed3969mr959555137.21.1783511337746;
        Wed, 08 Jul 2026 04:48:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb685sm4422446e87.46.2026.07.08.04.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:48:56 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:48:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, sre@kernel.org, hansg@kernel.org,
        ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, neil.armstrong@linaro.org,
        gaurav.kohli@oss.qualcomm.com, manaf.pallikunhi@oss.qualcomm.com,
        priyansh.jain@oss.qualcomm.com
Subject: Re: [PATCH v6 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
Message-ID: <cixdpxnnpzbicxx4a3q42hofofme3ifdfcmi5nocqa5nr3yxie@42jynw52dxb2>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <20260707192228.14647-3-daniel.lezcano@oss.qualcomm.com>
 <20260708-wakeful-cyan-caribou-35fd09@quoll>
 <bba69f4b-9a09-4e9e-98c7-3833924131eb@oss.qualcomm.com>
 <c2e5e168-bc94-4b17-87e6-8974bb83be3e@kernel.org>
 <ac9c6ace-31f1-4bd5-9d81-ec850179e85b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac9c6ace-31f1-4bd5-9d81-ec850179e85b@oss.qualcomm.com>
X-Proofpoint-GUID: y3g2JfcpbM33Mfm5BKii1s-pwkw0IXzM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfX7tRpmV9PcRI9
 qB9z13ICzmVT1JKt7VNSwImoV54Ugo7Z5nm78TUzCHhy4N0r8PFJOcgdqN8t5Gl7zqNzVCobC8i
 G/IQzFqf88VKucqSdO3yDkWKimQna2o=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e392a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=HGVAMQCKqTvNkjEGtKcA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: y3g2JfcpbM33Mfm5BKii1s-pwkw0IXzM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfX3O3IM8UGxySM
 1DcN7a+QeryS/BfdPScLxZwY3SmzWKN8Lm7NXqprH3uFalwVz7vaDWjgapgAJS4cSX3Vwml2wyD
 U2S+sJsF/raOqhQ/0s5x8/NRku0vjquQMYrHfIYq0jD2Dn8uktJkE3YX+BqXbpU6g5sJX1aTMX3
 /HmexcvhbHtopUirvj9LZjVyB8odhozljVBdaY5UYMmztPM2OKila7dflMzdH6eeeO+uXHvhm1H
 ck2ghn46JCxXsg0loFfpMCLYm49he9WHz8b8AoxxaUHXiR1i0cI8gWAr2RT/iz3ZLTg4C89XIYV
 BsOFQLw5/oqoAUxxI5N9Upxr1InB0EM/mxlwOU7Qlj8ormT1ZKGfW+T0V2NH7FckBLY1z2BmRZE
 t5CBMv1z1C8+MWLu2ti2gvDQR0btYh+YenwKudKqWI/dV4ZjrxanRo/Zf9YhI5DVfdfsddAfktf
 XPVVcEYb4sJwheMdg1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080115

On Wed, Jul 08, 2026 at 10:38:49AM +0200, Daniel Lezcano wrote:
> 
> 
> Le 08/07/2026 à 10:24, Krzysztof Kozlowski a écrit :
> > On 08/07/2026 09:31, Daniel Lezcano wrote:
> > > On 7/8/26 08:30, Krzysztof Kozlowski wrote:
> > > > On Tue, Jul 07, 2026 at 09:22:27PM +0200, Daniel Lezcano wrote:
> > > > > +static const struct hwmon_ops t14s_ec_hwmon_ops = {
> > > > > +	.is_visible = t14s_ec_hwmon_is_visible,
> > > > > +	.read = t14s_ec_hwmon_read,
> > > > > +	.read_string = t14s_ec_hwmon_read_string,
> > > > > +};
> > > > > +
> > > > > +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
> > > > > +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> > > > > +	HWMON_CHANNEL_INFO(temp,
> > > > > +			   HWMON_T_INPUT | HWMON_T_LABEL,
> > > > > +			   HWMON_T_INPUT | HWMON_T_LABEL,
> > > > > +			   HWMON_T_INPUT | HWMON_T_LABEL,
> > > > > +			   HWMON_T_INPUT | HWMON_T_LABEL,
> > > > > +			   HWMON_T_INPUT | HWMON_T_LABEL,
> > > > > +			   HWMON_T_INPUT | HWMON_T_LABEL),
> > > > > +	NULL
> > > > > +};
> > > > > +
> > > > > +static const struct hwmon_chip_info t14s_ec_chip_info = {
> > > > > +	.ops = &t14s_ec_hwmon_ops,
> > > > > +	.info = t14s_ec_hwmon_info,
> > > > > +};
> > > > > +
> > > > > +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
> > > > > +{
> > > > > +	struct device *dev;
> > > > > +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
> > > > > +		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
> > > > > +		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
> > > > > +		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
> > > > > +		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
> > > > > +		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
> > > > > +		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
> > > > > +	};
> > > > > +
> > > > > +	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
> > > > > +						     ARRAY_SIZE(sys_thermx),
> > > > > +						     sizeof(sys_thermx[0]), GFP_KERNEL);
> > > > > +	if (!ec->ec_hwmon.sys_thermx)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
> > > > > +						   &t14s_ec_chip_info, NULL);
> > > > 
> > > > Last time I commented this looks like actual ABI break. You did not respond to
> > > > that, so I assume my finding was right, thus:
> > > > 1. binding is not correct (although driver should be fixed, not binding)
> > > > 2. the code still breaks users
> > > 
> > > Sorry I misunderstood it was a question expecting an answer but an
> > > affirmation.
> > > 
> > > By ABI break do you mean:
> > 
> > Existing ABI contract is changed in an incompatible way, which has
> > observable effects as below:
> > > 
> > >    * new driver with old DT will fail ?
> > 
> > ^^^ this one.
> 
> When we are incrementally adding features to a platform and like here
> reverse engineering the device protocol of the EC. It is difficult to give a
> complete bindings as we are discovering things little by little. How to
> prevent handling all versions in the code when providing iterative
> completion in the bindings ?

Provide backwards compatibility. Here you can check for th property to
be present in DT.


-- 
With best wishes
Dmitry
