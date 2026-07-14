Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AF572617
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2026 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034982; cv=pass; b=EprLADzttVonx2Q6YIxipZkoYR7qBuT0ytxe+i5tHzxPlcV77SlliW7QnZGft57UAD7KJLTaKhzieyNKv+711EUxOjzHDsNm27f/Sivw4Ki64/479ZLTThfym2di9bzOzCKhm8tu6XCE90RhA2IrmgEAAymipeeyDeunJS+e/8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034982; c=relaxed/simple;
	bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taPQcZf79NhfIfN4wSKOTEV2xVVXMHlkoiDNBYzxUlL/YHb6zlFOB1S2rtibD4I71hy8RQxOMoKOiZFYZ4qlxeBFiiht6u6xr+fsHl/qjlC1SOIDL+na1o2/7nRHQZbPyewgk/+Eq7pSlQXefQBxzky/oqOMSQjS03azShqvhfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeDP1noV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cioL0yS+; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeDP1noV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cioL0yS+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBmnWf473944
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2026 13:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=; b=jeDP1noVY97TJJm4
	cIhajSXeAsAmHOxUZ5w+rrnFsmDqOKfN4qv1NciKwvl0a9vv59ESqt6/YuJgOXKd
	2U4f3xsKnro776B5eQXUkzzonn9zUj4EjUY0CcmNrVrEgX1hsU92QRCgcXc88Zk4
	AtF76m99A0GiWR0qvmuA/OQHihEj2e1+CtLRE0wEH12PxEsaH+fBoJe1xohiHUcX
	R229DzrrEXb5VIR1CijlNq+5VjsfmV0mgJza7rCEwLCI9oqIAHjuyOO3YurOejU1
	OXk05tjGT7idOG9xzgxgye2BrDtcmOkjjdNsDeOVdRx43SKY0RtvrJ1yvDvre5qj
	UD2uKw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq0cd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2026 13:16:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e934385db1so77221306d6.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2026 06:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784034980; cv=none;
        d=google.com; s=arc-20260327;
        b=ppy3W7kpUKLHRzraiuWs+lxTeSJdqkViKLofgcBgggw3BeGPQ8NOmPzcPKwaBQhPnW
         Scdh4lrmugq5cnUQgPIJkZK0UNIzWj4yEpb9H2ait+G8QfUJdjnYU1WBiMe1F9+6kne8
         FmwWSua5MKIRJy73LPLH2+DrWIJJ8aGcTXHORX+7Y9IzBmN1yDHiFZie6TXjaf88u+Wg
         hqr/7jgui4GKKnLbiTq88a+rfg0qeeKdGw5I0CfXY+cTzXraWGprHbzdNeTel4nwq7l9
         tqJWOGId9IDwzfCCcA4JvODobBpFBomRcOPjYJ5FKO4PC+7fsthKHLrxcZ2nw7HpD6JY
         DSLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        fh=//3p+/UfIXfhxltFowMtdopbd/3NH6mZ28tUQmbVV6g=;
        b=OSrbVOu58s8LsaahHjMQA/1dZvLJcsuxbRA2Y5FPiGjG3/EBjaRMM+6OYgpc+FTC//
         yNEEQc3dWzto5Ih1M0zR4sng/OJ1jRUKnrvTMgyeOWi+WjgM0XsXbtNMFIVO0sks1KDG
         t/9FOWkeZF8v7BF1Imn28XzqdHNCwPL4Tnom4sCxKUQqfKR3+XXADOxk/iVEDQclxgqm
         w4DQSILNDPnerLoECYU+lnpV4ju1J+AqgmIAgmHtVj/W/3vNmXzi8wIV5/InPW7YhXtS
         U9R9M3mcNqe0iGi58oUL49uo+lzCIll5dKUksEgANWanPTFHqN2XmuTKpTJmL416eFxe
         Oy0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034980; x=1784639780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        b=cioL0yS+m7iQ+Un4y9KPRfCvUwbZxC0xQRu+SZmRcgaQHlaMpOuyJETcrk+xsCydJS
         rx/JXZ0vlPSJ46zxZ/moLbkLzEFFO0TXJ979XZx4o6mPym2i9kzroOI5kygxFEe6Bi5R
         LgVxo61fu3nXasj+kizAbtRICOyjFgRCjtp6XrZ7uzeP0UIS813j7bgUxON3fRhe9zGY
         e7doqxvCPS1+FdTC+4IGTzIMO34POO2/rH3keQo332wYpg9bskUCjm7FIcDtJLzWa07O
         /D1x4xq5YKRCc7P8jD/k0p8unDHZTD20lZwtiaqEydbmFKT/XzVNkmPqitS0BB28LQTQ
         x6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034980; x=1784639780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        b=BxkBjxJoffMPirZ7KCfArimnKtQnKl8wt9x4lokswaRFR14mWE6WqO0VWm0jbifMto
         PMfQzUqHYo6FEPBnsMWxv55Ksma/R8ZaA5h6xuJUlA27PRBoAJZwH6bEmFPyRz2mkMbD
         8bxMvqtvasa+jHcgapuxozR2SvwrJDp1BCy0fjkdKUYAG94kXcHhjJgzKNMIi3iCuO3M
         6dEUir+zMcTrE5tMxzbcVUbng/+qPmhQVH/DrFFmnRW688/FS+hzDv5JQUEGKxQqYg3Y
         9JCVoJeAA2DqAdjomOHNUeSFSCuTkn3V5wXDIJv5HiSjUWS8YTLWfDpXBzzWlOxmzwus
         dUJA==
X-Forwarded-Encrypted: i=1; AHgh+RpHVaGJ+ca4meY4wdWuhauQUXH/O9yoM1jKsIxQw0PMctqxHV73qIHqBWmTBx3TBN8rsYd1OT2/X+27Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWCD+fKqXHgVLboBoVupkEPEAgHVeW8IVfPcXcYyRrm+eMBZxu
	c2/YCF03HXxxuTJPDNuNTSiTTTFfqmyTSPVsgksGEq+DD42m/i3m+9g4y47y5V4PJ9e6VDHZ0uk
	6wQpsAx/ohAmQxEsHMiwpi7XITEjyVNkT8dYlyX47OBtsiW8qIrBfSzSYh2fCycesJFQ6YWoMqW
	eUi1AvH4K1GKf4gUwypqwZZnya8skSMOoOXVRJGxe7
X-Gm-Gg: AfdE7cmJ+R7k36Ze+7dKS1zDPlYtgqYt7YOIPJwUXcapnA2GzfaIn+MV+83mb4br8Zb
	MjDR8Y3L5g1mTuNna5Fd9kHUfxDIKhJjP1FI2O/p/Ei3Ew0NlCznUl9R6CjQwNN5XH9LLZHiXGv
	jKeeiTsu/WEnCZt0VQlDCIL8SQsJLTK8px5FBOravCd8qlTSXWDxQSX20sK+OKIHWa0Jg6
X-Received: by 2002:a05:6214:2689:b0:8f2:67bb:a37d with SMTP id 6a1803df08f44-90747d19fb5mr45880266d6.57.1784034979485;
        Tue, 14 Jul 2026 06:16:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2689:b0:8f2:67bb:a37d with SMTP id
 6a1803df08f44-90747d19fb5mr45879656d6.57.1784034978901; Tue, 14 Jul 2026
 06:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <ak_Eu_eQKalPMwo-@pluto>
In-Reply-To: <ak_Eu_eQKalPMwo-@pluto>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:16:07 +0200
X-Gm-Features: AUfX_mxKzpq6RPl9OYBnCrjfKgjOcnNPKcB_AjUZghzaf78uP1r8iO8ekjIwd1s
Message-ID: <CAPx+jO9KMcxnmt-wT5jaApj9p7s11B6eSG6K08Jt9J=-vXxjhA@mail.gmail.com>
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
        monstr@monstr.eu, git@amd.com, vincent.guittot@linaro.org,
        Souvik.Chakravarty@arm.com, Alex Shi <alexs@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        David Lechner <dlechner@baylibre.com>,
        Dongliang Mu <dzm91@hust.edu.cn>, Fabio Estevam <festevam@gmail.com>,
        Frank Li <Frank.Li@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Len Brown <lenb@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linusw@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        linux-arm-kernel@lists.infradead.org,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
        "open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a5636a4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=7CQSdrXTAAAA:8 a=K75D1l0-MnsISjLg7T4A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: Qhkbe55KRB5KgIFwZ6INtU0YNGyekJnV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzOCBTYWx0ZWRfXwnrMIXKHsn4B
 KtEOLpAWDDp3WAjeCD6y/SDnLILeV8AiWwKfUQ32tL1maJGRuaZguTLOZsP5+bYyeYtHzs79p+L
 JxHir4b3PllAhqGFXMBhKWtcw5AakJ1pL5AqzBe8YLKxsdJTZicgXIgitTzxMXm9549MhNVRDoE
 6pnn9KJPY4uRAjI4gZcgHH2nnz6VlGDqyQZse/LsTA6DNe8OlvXegy0f4kCn9kwabQaUztFJIj8
 4DhkbR3FN31YgE6tTyoGAik064JxCokyivDIO0DxVxS7WGc7Cr1rccGjX5o9vxsfsAquuzXzM0Y
 Ww9Pxvw+UmdGKkjf177mP5kDNiKyMsxWhALVqoNNn0GT9ohT+qSvvez9qoZXJ0te5aLw0xjOKCk
 6YfXjELwFkxpVG7msfGP270VX+iRg2qoMTvfpdRsQ4iMqwCOTrG7iTjpVyNSh6DLetuZZRPYXzh
 v1T8lEkgnoh4zoWpILg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzOCBTYWx0ZWRfX6+ADmm8ZNDcs
 y5XdpH4X8p86vy/sLHpd+HrowA4tQjBxMU1EKv7cQbii8n+y6R5nEX24bo7F9Ha0cV/4Wq/S8/8
 LrxBGPrMgjsl9NYWkbrZkOrgewrHX/k=
X-Proofpoint-ORIG-GUID: Qhkbe55KRB5KgIFwZ6INtU0YNGyekJnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1011 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140138

On Thu, Jul 9, 2026 at 5:56=E2=80=AFPM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
> > On heterogenious systems like AMD/Xilinx FPGA there is a need to talk t=
o
> > SCMI server from different architectures than ARM that's why remove
> > ARM/ARM64 Kconfig dependency with also remove ARM from description and
> > rename folder to reflect it.
>
> While I understand dropping the dependency on ARM (I always wanted to do
> that and test if it worked at all on some otehr archs with QEMU), I am
> not sure about the whole renaming party ? why is needed just for
> cosmetic reasons ? it is at the end an arm originated protocol so I dont
> see it as a being wrong to be named as such even though used by other
> archs...I have not really strong opinion on this...

This is certainly not my call to make, but I have to admit that I
fully agree with the above.

Usually we don't rename files that indicate a legacy platform name,
just because a new company/platform wants to make use of it.

>
> ... my concern really is ... wont this full scale rename simply generate
> a lot of un-needed churn for future fixes and/or backporting ?

We have some git magic to overcome most of these problems, but it's
not always straightforward, I think.

>
> Thanks,
> Cristian

Kind regards
Uffe
