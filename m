Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3042D0607
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774023002; cv=none; b=QZcPxxtL+Q7a4HnTk+fIGdmWJ6RfFgTTWsmTDW/6cKtDLc6EYnbkiJJzKaLkjDYJ3NC7bptXpeV190DvutmAVqywBtcAfkenJ6g9vO86kPcTfOwZXkvTw9+xOwccZ0N+C0AD03tf1hA/WMi1kJZy8XsWIeJXwkAPlVxXQNWfb5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774023002; c=relaxed/simple;
	bh=3MyUBD78giZRFdZI5eY5P4Afct6NIXZljsU8gNgUXRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkVWFOW4vhN8VDKQlRQCGzJqf8ayG3VcBHCK7PicjH0tawTg+qPjdkk5USLO7vwdDgxLo4+PhV26dxjBEvWTUwdo1ZyK8QxmMvUOZXGgF0N/2cXQm9quBqt9Wr3ZJD+ooQUzp8Slrztb3YYJIG4rerxX9kZL5wfcJVX5wY9hPt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ga8pZdjv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+96vdDo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ga8pZdjv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+96vdDo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KEFALJ1191320
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 16:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fV71a7gjTb6A4TU9Ni1s4ntEZ1N5ACGLkGmyO0wTkU0=; b=ga8pZdjvJAhqzGoQ
	D3AUx27dqm4V0TZaQOLNm2Eojb4G84wCiSwU39No3Ic4mO0d8qwig4sp+n4lT19d
	UW46aevQJXoH+QBO531Sb3x53B8czFFa88YJot8gtjnYG+X2vfD1CKKx20DNhPHA
	Yvtg4bEUcfYPSlVygE2Umy6zbUcRnrlhfXLb9UYwhXalf07pyy24RTlxvjPCi9zt
	DmV8jkzY7mCF9l34SdhIcFEQlVRktikKSwp9MzxvkijVOanfi9VD3oF0Sq/eXxZI
	hpzWeIoX0vzfM/fBlpFMlw5OWgz6wZ3lqF3yPc7KRv7OIKGsQChEIJ3Wgv9xzCXz
	hjdGVQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0pvhtx44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 16:10:00 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56b772e53d3so6916995e0c.1
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 09:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774022939; x=1774627739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fV71a7gjTb6A4TU9Ni1s4ntEZ1N5ACGLkGmyO0wTkU0=;
        b=I+96vdDoS66snIAanPk4015Dn9NvHJJbOiNaqtVVuEYz32oVJ7OV3VyCE+dFbjC1Fa
         gBhrhYYaAwgfiAAyHqFQd1sAluplsr3GvXxtDgjipg3n4QxCx25fgkyUg4w1x4EqfgWt
         E2uePYW9spKMcTBOzKKpN41z4v5PS8g1MzWUFVZb4VQhGtV+nVGaRaTje9XNA5p6d5wB
         0itau2E7jSOFpivuWUNP29JBrtkq8YihgzFB6z3isnvRUGem9X7ckKzLuwMP7eLtuM3K
         ybm6mTmWnRDUtkoQ8ZNwAWs0+ozDoO1jglhV5buTQp8qOBRPwVLRbooYj5Nv3HERuK5r
         VKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022939; x=1774627739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fV71a7gjTb6A4TU9Ni1s4ntEZ1N5ACGLkGmyO0wTkU0=;
        b=bHHCfTAlMmHFrLfppcLyQf/PNpFW+omYQf57WPccy1TRabraHmmu9ou7E09dCBb08Y
         6vz/jKDQ/p1bv6tNA1kWjtqXSX4WUKJb3/Vzuh2dW+LU3GvaphVLfOim4FOXGWnIBJVP
         yk7sYii5kFzUvntjbJDgF0hGcBHy2xBOA2fafkyyaYye/aDIV0BhwUn6YOihGtMHRR+u
         Zn1zk6j3GuQ5c73EXf574Lw27jFPC06vm21e+2aG66cDTUXCppHnp8KbFOAJIqblpkSM
         T1E60PNKSUgnHPF9uVmsBFZV1RVcSZIg9SoMRQmXeZrUhs3nlOZnTli/9b2UrF7BIZ5t
         +Bjw==
X-Forwarded-Encrypted: i=1; AJvYcCVwqbcKZzrl0IcRqA2SScxpoVZywD+5/0BGpcS0YrVSayfUu4AC4ItE+WUZ3VxAM5S1rDBaT14SJXBV5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRYjAE7EJrc+Jyoe+mhSJwXWoFB/HStMRm/M1nsPtncS4/ew+s
	jxFbZ0l2PjIiyF30efyiCde28N5YE06XMUzbuX24Gt7Y+xA1d2EcOq7t/ApKg20FDvDLEXN9AZi
	jC6T8KOMRRkfvayx0DCUxS0cA3Hu3oQZ3dmPIdumVG2t7S0m4zo76j/OxRyBnNyiSnHOJ8zFGbg
	==
X-Gm-Gg: ATEYQzwIEmwOwZbqUh3+yKkDlgZkUBv1of4huBR5FM673hONrh8lofPfsm2Mb6iSXQF
	gJl0IbyxGaJXkboHnDDnPGxLWbhBxP5n2eHpBJ0RuUbrsoBjfWKeC4DS7A+W+0CMjVSM/nKHsTe
	KdQXAusUk3k8rzwse0AIX25W9JQnIjU8/DGA4nw1x50LCo/6+lIlJuXJAB26kk/9HTH6ZE34Pac
	R85hqPdFIFfbZOhJP4K621S0f13tWIQ70reerE+Rcevw55/wRxgPYK9+OBa1Sz28B/uIfr7YdCH
	kynPEXWIfptAEyHSHv3KVRTjG/58NSw93CBNSqwod2Si9qz5z9hqz9ggoM+tNFecQgngK6qf25n
	19qa/jQM8bChD6i4mJaXEZsN1QnabJYyqyYAH1JHwJb0J9/MW8fDzjYrvdzaHbcipvAgKgVb62M
	FL6v4pIdP9
X-Received: by 2002:a05:6122:4fa2:b0:56c:d5cd:1e7c with SMTP id 71dfb90a1353d-56cde3385d6mr2070361e0c.5.1774022939248;
        Fri, 20 Mar 2026 09:08:59 -0700 (PDT)
X-Received: by 2002:a05:6122:4fa2:b0:56c:d5cd:1e7c with SMTP id 71dfb90a1353d-56cde3385d6mr2070317e0c.5.1774022938851;
        Fri, 20 Mar 2026 09:08:58 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6471a297sm7991764f8f.37.2026.03.20.09.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 09:08:58 -0700 (PDT)
Message-ID: <6f4b27c5-074e-403a-90b8-fe7ef3a993b5@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 17:08:57 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
To: Guenter Roeck <linux@roeck-us.net>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
 <ab1fSWx7pqlSANph@mai.linaro.org>
 <a922cf55-ebe7-4256-b3bb-cc732e45e1ff@roeck-us.net>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <a922cf55-ebe7-4256-b3bb-cc732e45e1ff@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F95at6hN c=1 sm=1 tr=0 ts=69bd7158 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=mvinU2Bdfd4mQl_lFVsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: ycH-z7umDgfGDaWjbdOduKoCXc3Y_uMk
X-Proofpoint-ORIG-GUID: ycH-z7umDgfGDaWjbdOduKoCXc3Y_uMk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDEyOSBTYWx0ZWRfX1kfMAg9fcj6v
 2tE1y1oyEEXPwnWrdCpOl8tYaqYGnU5HKtti8mVSaQmwWT7y+48tkpDQpHKzdDw0zir5zRiEwOG
 j2h06AXJhsLJYBwJg6ERyxpo7xECAlQCTcTpsWQZ0amjn4px3L6Tq7JC0rkLYIA+TrZEunhYpCg
 8KzfZrcZ/iF6q1XU0OJydq3HILt8uWevjPoTZpA3DrYu/efMVk07YsC4YqEindyWRRdj1oS+ez1
 lKxz0GcLzylI7vHQM87YUFVCddsBEpZPUCXDuy0498iwcrOFfBHLXX76blxE3GaKfuKslpEdqIk
 vQKFyRnMZvN6Wdb7QJiw8B7a8EkH+bQCYvYBdvYDEt4agjAyy3pI7sNGBBA1mmREJHCooPZuevh
 OolrhARhtX2zPZpJScvJ8jOO5IT14qOLu0L/llLvTZO9eLnMh/g6UzpF9GrWUIMy3MJPzepq+ae
 uh2Cj5ojm+/PgkM6ftA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200129


Hi Guenter,

On 3/20/26 16:22, Guenter Roeck wrote:
> On 3/20/26 07:52, Daniel Lezcano wrote:

[ ... ]

>>> +
>>> +ADD_BCL_HWMON_ALARM_MAPS(in, min, lcrit);
>>> +ADD_BCL_HWMON_ALARM_MAPS(curr, max, crit);
>>> +
>>> +/* Interrupt names for each alarm level */
>>> +static const char * const bcl_int_names[ALARM_MAX] = {
>>> +    [LVL0] = "bcl-max-min",
>>> +    [LVL1] = "bcl-critical",
>>> +};
>>
>> IIUC there are three levels of alarms but the hwmon only has max/min
>> and critical. Would it make sense to do adaptative min / max ? So when
> 
> hwmon has lcrit, min, max, and crit alarms for all sensor types, plus
> an additional _cap_alarm for power attributes and _emergency_alarm
> for temperature attributes. There is also a generic _alarm attribute
> for each sensor, which is supposed to be used if the specific alarm
> type is not known.
> 
> What exactly are the three levels of alarms ?

Manaf can give more clarifications, but it is like we have yellow, 
orange and red alarms. So there is an additional alarm comparing to what 
is available in hwmon. The proposed driver maps orange and red alarms, 
respectively to bcl-max and bcl-critical.

I'm just asking if it is important to have this 'yellow' alarm ? And as 
there is a missing alarm to describe it in hwmon, how can we use it ?
