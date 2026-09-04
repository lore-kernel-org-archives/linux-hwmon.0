Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCBE447813
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Sep 2026 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515107; cv=none; b=oQgNQVXW0tuSY5nS6grnMR9bVV05gNnf+IKqxfD+ywTboxypgGPJCCnh/AEtcVOCu6VyHQcUCAktKblSEwPsw0FJR1Y3PlhrndZ1Fq+b+UPeyMrXdy6hs+qIjr0UWsI+TPkoDpxZJVAM7ynW5lfO/xAFMqwec0u+AOIOtiQzwUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515107; c=relaxed/simple;
	bh=zVrsOBbUBsqRW8lZE59vCWEnEi6cLmNkhdl/0iaYt6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uxa90ypv75jtHDg/2d6nuIUKXEj5yMt9aMgLSFfn6zUxk6j1/2tiv2QDGvLx/StM1eFlZzQEiiLtDn8SAsyaMg5vKpYbTbPhezRdaWOdEFQiV7XF5ygmHorjLUp5Cy7sd7OCHEzNW7ThU2Ocl3Lqmue54wibUOpJMW4aOxRG7V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+ylvqLL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQsxj/5Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+ylvqLL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQsxj/5Z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847n40T2976892
	for <linux-hwmon@vger.kernel.org>; Fri, 4 Sep 2026 09:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8D5YW4aMjYqkv07n5OIFJYINICm6DBJu2yq9WVbe+8=; b=I+ylvqLLLLgJPGX0
	J4MRCr1bKezTgXDYnj6VwxvaI14kiNq83vRgzc2OZShwpLAt65CC7bWQOOG4NDhS
	eZDowL7tahOXy4y6LgcF/EBMEnjEtcI+4wxlhPEYGTBZEqqQwJhmIqgOf4C7NQ6w
	13d6QSs7uQCmoydDb8q7HwMz2EHLEBg1XbPDTy0M5TkenpgtSw7PcoF9AvcoIqg6
	787fNoKGjFPZEYr1yGKEQLGxwd6Gxy/M6zpeDaxACjYUWemAJxPxU7h8rTYogyvt
	tXa5KmElgYFevjgXUEq4TNcPaI67wNgCiYMwiyUkTQNo3f0u8C++t8KAmwBa61/G
	9jC7Og==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxjy3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 04 Sep 2026 09:45:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ea38b1e7eso2073841cf.3
        for <linux-hwmon@vger.kernel.org>; Fri, 04 Sep 2026 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788515103; x=1789119903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8D5YW4aMjYqkv07n5OIFJYINICm6DBJu2yq9WVbe+8=;
        b=NQsxj/5ZbKnlN7KuwJQSCkGUz9r1PEtjj2RPLhJVNwnFaa1tuoauldZwkqLbVMHSKs
         M4O/sxML/bdXlpPGVCkco+agybOVoFP0vTT9fGcwfUPaUla2JM8tfNk6OMrkHepxVVa/
         Ynp5K2ID0amUZXEv7qvzvs0FEfIMzYUmfKYcPiJEQTqMsWXIaux2Ki4dLYC+g0FgQwST
         HfaKse8siim9lfVvCwEToxLvJgUoW702pvdEC7U52xr9J2HrYNMm3zpFa04jUNPNqnSP
         YhqNrjsQ/MLGcmR+qlDhe+kKFyp37sO8Au9BRTnfiQV4rmIuqfP/viom6pUPjtNJ5Omq
         KOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515103; x=1789119903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8D5YW4aMjYqkv07n5OIFJYINICm6DBJu2yq9WVbe+8=;
        b=AeR8I5qDIvnJYWV2/zmIQaCsJT2oe2frLJrw+VfXezpn0ozSWm9RMr4oTw475jOHoj
         xgNZgwU37+ICCMsRzEEyh/bGM8XUE61Y0pr43kIddMbYK0N/4cp2Fyl04FSB7GsYztNB
         FF9yUHOjxx3hK7/hNLjTomfRVhH/KRZ1FlHoHD7SaNSY1ZQgAItR4MdJ+CfT4rf3YawH
         mpKgFi1jamsEomIXDgR6s8KTXpl8b7OCIfzsLsNNZdDTt+MIGY1cioxjN8tHCQannLKe
         h3WECTFKcR4ROfWCMmw+/4GqjCiDaPvAWgOMvFhOqGX7QFc3YtqJ03zNcxw2Mlg3ewne
         mniw==
X-Gm-Message-State: AFuF++kQhjiI5RMA56kqm5tqWS9zO5ctjKXJ+yJFXrefEPJ8hbsDM9bD
	fmhU6xvMVLI9IbiG/i1Hmi7zb+7D2t9JtXeTbezkd3Y4sM4VdItMOnFJ7WOjKfwvr1UFi7D70p7
	Vt7JOv6+0SHk9FqVUkZVHUVIXdC4rYltLgrwWiCN79Zf2T4xlwIjuFSRqjrGNqVyVvg==
X-Gm-Gg: AYBFou2bzkmjEE/10KiaN9DgbCpwHwTFiG2dk1F5zP1LpjCY18PBTLkb9ruEzOzeruL
	o1zDv4XwFx8fARie1/LOIqUdayilcR8llmsIkmrJx2e4lUG3xVkTA6fUCedE0Ijjsa6Meh/W91T
	PULv6KmxUeQerLztTK+wwqSY3++yU8aztc6rzAj07LCLJ0Cze+iQMB1TMBiP7xwnSUUJO3f1aPN
	pkyt7ymnherVcJ/VmhhaLgUgdJaaI+Ug4IlbsSdQwxPTqMeGy62joXlpmDI8sYjxoKgZ9Cr07fu
	0OrH4byLxeSUl3aFtFLhIlBESQKS/xh6/MZZpTlZ9zklTlBvSO4d39uB61AK+NiMFKb5/qsjzoF
	ZInGLLh0PKyPO7Oa/MXTwcQ==
X-Received: by 2002:a05:620a:4686:b0:939:47f4:935a with SMTP id af79cd13be357-939807adf30mr345133185a.5.1788515097815;
        Fri, 04 Sep 2026 02:44:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:939:47f4:935a with SMTP id af79cd13be357-939807adf30mr345131285a.5.1788515097419;
        Fri, 04 Sep 2026 02:44:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6dfad6sm83831366b.60.2026.09.04.02.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:44:56 -0700 (PDT)
Message-ID: <62c7ed77-32c7-4e4a-ab44-64bb174a88f8@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:44:54 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform: arm64: Add Radxa SVC GLINK driver
To: Xilin Wu <sophon@radxa.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20260831-radxa-svc-v1-0-7c028de6a387@radxa.com>
 <20260831-radxa-svc-v1-1-7c028de6a387@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831-radxa-svc-v1-1-7c028de6a387@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fdS627r2jlg1ViLxsq5mtXzrH03ltbjB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX6+GHx6ZdCznY
 nvQfPF2CwGBVp+islRGqqtbrWIAyXTpxEX4ClMGxRQBln8gMXcXS+vMfG9FEDpyXUmT8TJk8YGm
 uLqchX6KbZJ3qOyO/eVes5gsa1p9QFo=
X-Proofpoint-GUID: fdS627r2jlg1ViLxsq5mtXzrH03ltbjB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX87/NJtMYmtXQ
 QYowHa0gfxrtLXMdGLhpaOn9pKFZf1iktGfWhqT4jU8fEwLPrs1MKBwT39xIXwCTUVFk54SMBkx
 c1Lf7yY1HXgxNqooMDGA5WE06NXt82ix9qjrk/mWN/kTIiYxBCCSJx71e/m9IBDJGZHmDMzeM/t
 UgGFqt7m1clw893hORpayAqmSEXun9vfRv1U1Aq/Rik/LmLo6VOsxk+nlCjLuDiNWMB2xP37x5N
 3upPzic539e5coD9f28GDAfOHjfx+oDyvVlsbdqIa3cOjK1B/QbuQ6S30L3k1OYFrist1KTGRfF
 1xpqPwC7tUin0jFSbeFjl8rRBHPpq7knsV/Jc1Tg8c1HYAKeoCuhyH/QFUjek5NawVoY9I4JFKU
 spdcPjGobXyYIzir2lBOYZW0l25dL1ntNpwG0iCBwN7pbas3+VpM9rRTJGqjnUJ/tfWMF0/oHqQ
 tASQoJbJ1eBMB+8svAg==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a9a931f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ksxQWNrZAAAA:8 a=oytB4wdSUnn8FBOm40sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040088

On 8/31/26 5:09 PM, Xilin Wu wrote:
> Add an rpmsg client for the RADXA_SVC_ADSP_APPS firmware service used
> on supported Radxa boards with Qualcomm SoCs.
> 
> Expose fan control through the standard hwmon pwm1 and pwm1_enable
> attributes. SET_PROFILE only changes the fan curve, so map its quiet and
> performance curves to automatic modes instead of platform_profile.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

[...]

> +static int radxa_svc_request(struct radxa_svc_glink *svc, u32 opcode,
> +			     const void *req_payload, size_t req_len,
> +			     void *rsp_payload, size_t *rsp_len);

I don't think you need this forward-declaration

[...]


> +	reinit_completion(&svc->rsp);
> +
> +	spin_lock_irqsave(&svc->rsp_lock, flags);


GPT says:

High: A late response from a timed-out request can complete and corrupt
the next transaction.

In patch 1, radxa_svc_request() clears pending and returns after the
5-second timeout, then a later request calls reinit_completion() and
installs its new pending_seq (patch lines 526-540, 550-555). The callback
sets do_complete under rsp_lock, drops the lock, and only then calls
complete() (patch lines 612-624). 

Konrad
