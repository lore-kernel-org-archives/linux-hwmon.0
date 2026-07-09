Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226F2334374
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 14:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606043; cv=none; b=fua8fDpWoIZ8PXmV7XnLFIdLBF7Hj2OEyPOS3NR6nwgeeeWaoWZeMuqCssfidkXtPx8dqLifd7cwWXSt+l5S+z7WR7kodE3pGfy3Bf64qi5wWPXDV/YOePYHRK5kbz6MBqBdU8nFudEe8zuTmTblvZr9DIP1ZzDvjpVJFWtIKS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606043; c=relaxed/simple;
	bh=/bYHC6ljg2WQE3J+hhPWQjPMOcrXeK0n87YNg5RX++E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CQWFuJ6hEPwrakqHJoEIjMm3lADE1GhU7zFPvExPe9hpoRos1YqJGOJ3i2zQU46m+N1WZO1Y09DysGsRV9QAjwsFp2fHEjckCEzCQWqILbON9E9UniXXEkdyNdyJdkgiNEqSUn9SRjotSR/K3wnjhPwaLfjAWKu4jQjcCPZcclk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9VjSNvC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnyYnpcq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9VjSNvC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnyYnpcq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DwMTs1834257
	for <linux-hwmon@vger.kernel.org>; Thu, 9 Jul 2026 14:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/y/ahoOnHj/TUbb1MBrebh+AQ6I/elKTEZ594W2J7GI=; b=R9VjSNvCHGYmCikI
	POz42573KX+Iw8RgVFzKweFwM4uIUVDrleq2QM4u4N63wFSC6y4eafKE9g+j6oJa
	wexGDy5oP/PmZX42bkzmF/XrlxpSS6BX7oIEQZGzCw7j6s4+GtJc0iA1pbPshNHH
	cf5CkhjCw1KEKiXHeOGvqq8Aj1T1lvSY5wZ/8MunyUee7rcn8OuxeqGMjBHWuwtU
	C/DUKHRVGdTyUAlWCTSh1TThGgE0dx7ILNfY7enxMbLzoJiknXW7dZ72gHeDUbrd
	9D7nHt+t+WqUrbC1OrumUCyLK+4XIsL3yVhUniz4wDq5znTasz4NYtkq9CNCHNSO
	VEq2oA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfukbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 09 Jul 2026 14:07:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8c689b5fso15984281cf.0
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jul 2026 07:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783606040; x=1784210840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/y/ahoOnHj/TUbb1MBrebh+AQ6I/elKTEZ594W2J7GI=;
        b=TnyYnpcq2uOXCXCyRwKfEJ2EfLOHmzACzv5GIhZMapicJninlVoDA2CjIa5CNUIgwN
         q3nYKA/F7Ml4ee6ppKVSpWxnE5i6WPQXFHcOnMN4ec7zoUWl+xG4Uzan+yJ1k4caZdHq
         cDVr9byymwYaak9Sv1mgF/v+mCuMnJorLFo7R4118dehJF4mOlLu/PvJp+7z/KrgPHhR
         8Sz/GO3+T6/WCP+i3bZp/26u7er7oQkeSW9LQmS9S5ZL/krGIgxpZOfjuhxsXvlp2xqs
         r6rlBrPZp1iTE8Nfec6ybJBfJsgqJXToPSAJpp3VEzifH6sdy4lqU/SyacE3g+sIszD4
         RtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783606040; x=1784210840;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/y/ahoOnHj/TUbb1MBrebh+AQ6I/elKTEZ594W2J7GI=;
        b=YVeexwvSYGQ1O8C5yK80rjV15OUzINi5oVH3osK8RpDhZChXpPcO1DYADkpBzRAbrc
         Jz4cQWvsVNTxBqw6A2ZWgbaycfCxq41sc8QqmNLi2wC0e3J+uKhYPYMx1COFNN1p6akN
         y98gKCbqpQkiSYEJIK+hlom/IVOUbfLolRc/pw00MYhLLMOqxgky10AIfg1mojCHoj1Z
         APJyegLp1l6HU0ziq4DuuGq+rOjh/M3JZaQzV6ykuvv9GZFPs77KR5OP/rDAgdSwSjBt
         2tESa7wgC3uvBEDaiSCnlGh5/8naElrym8IWO42WtGlYYclTC2kvRpNuhlzhyS1o5YwY
         qNMw==
X-Forwarded-Encrypted: i=1; AHgh+RoMy++mi/PmtaLBL4UxulNVKoiflV+rn0UEmOeh52Xg1giZ6hfuIsSF0fTzmBVD/aF66yu46vdOSxhSkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvIsPm8D7L4bqlfVsCnegKf7ujDXau0g5u43l6N8IQjvy+KxIm
	ofPtPU3VM/vTfYjMxvrfAmxFQyifGIHWHcE4IO4pBVDt+0n0OCzYWW3hscFKO3ZhronuzRGXi+h
	Cmbt7HMhm4CfkXYSm7Pyf0WTffo7Q37/3sXYpaMLFMTJ5wbS2aQPGAZ0IRmAsRJdNtcwH4LL8g8
	3i
X-Gm-Gg: AfdE7clHRwBrlOFk8rNXUGacMF9PLTQXLdM/RHUIItj7gEhezrF4zGPnAxutwjkZo/j
	52dikmGtRIF7RX12iZh/Dpcsl8lEE+OugWRBKe18MEd+PfV+/IyxdoXbjB3Jv3+zIYYT38Ry+tY
	aZJAWkjlYNOC3W6avg7uXb551Y3pswqA+Ac/lXVbLedDEKe7Y98WdKvoutHHmX6M19GJQf7feYY
	Wek5YjjaiDapecAiZZat6cWTa4owSP5vZgCeNETZ90yzwL02tZP/G4kC5Kip8LUvTgay9VHp3we
	YjcHIK16uG+sswppoLZcbD/QirJBDDVqqua9IORPr822egGNjre2RfJ18hivco+sTHNIm5yETUH
	Swa6xAsjag9u9wxl/rBWnikSq3ycaLMbJp3Bli7/QgzDbW0V3Ci3sW5EIRTm5U/39ZbRIue+cFO
	iJqQzJQK4AwJRUPmG0t2Ht3UoZAg/+HLExOFhYQ2fTwdFc3hF9RmtXnlO5kdsBnkx9cysEValZw
	x14IA==
X-Received: by 2002:ac8:5d88:0:b0:51c:667:7e30 with SMTP id d75a77b69052e-51c8b4d60cfmr76151791cf.47.1783606039918;
        Thu, 09 Jul 2026 07:07:19 -0700 (PDT)
X-Received: by 2002:ac8:5d88:0:b0:51c:667:7e30 with SMTP id d75a77b69052e-51c8b4d60cfmr76151081cf.47.1783606039359;
        Thu, 09 Jul 2026 07:07:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c79f2a3fsm301861766b.49.2026.07.09.07.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 07:07:18 -0700 (PDT)
Message-ID: <f05860be-dd75-49f8-b27a-bff7b554e71b@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 16:07:17 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
To: Brian Masney <bmasney@redhat.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        Jyoti Bhayana <jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
 <ak-h8oPcL69fCUg2@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <ak-h8oPcL69fCUg2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNyBTYWx0ZWRfX9lSAgCv4lSK0
 pqWQXNiPlWXK42Jnfa8clLRm6dF923LGWipICbSiE5BURswKLbxc+xkPwzzAct8zd9MQXMOjkwT
 +ImhTkUcNacxlIxgU1vR2jE6hAwEV/C4Jqk2N8Zd7iSci/BfvJQHB0CPjBRaVmGM63BfOTpQ496
 HW56e2Ukmcmk0cb+KUVwHtgZgDOFm+lDSjZ6xVzPzfDTArMypEb8MqreTu7PhX00mwbpQ1uNzzs
 6S/OnscvOVGuawTr0ejCmIuGEmDqkgynnuBXOrUjE0nRH9IdLyHPRh+0YeT+GtxbdcWl8O0ffH4
 5eXPoqspAN6RUO8MRffjrQoelnJdg37hJ/oPLpiWVbwS3Ux7xeLz2YKTNkyQ0pPgtXDUIVKqETW
 daSjyJTCpzPdDD6aUYF6Lq2AhJCTAOrYVfL/Dog9V+A6Axqu9h8+kmgMX6G7cP+9QXw6AMSpJq/
 A8z4asqeUr3ZXEtC6FA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNyBTYWx0ZWRfXytACPODid1aF
 Wnh+cqwcGh+b/h0WvdZGttI5acqrG350EF4y9XL6zAZcFqi43KCUHRKFT69/uUZttJMgJff4e2m
 ahrijcAVYtYD7HH+M93rWb2ugoVawQw=
X-Proofpoint-ORIG-GUID: y-aobG6UTyQvHy8bduh8vZtAvEFMyhus
X-Proofpoint-GUID: y-aobG6UTyQvHy8bduh8vZtAvEFMyhus
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4fab18 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=1Iq74HBXAAAA:20
 a=EUspDBNiAAAA:8 a=F1v2bmbY3Q6w0W2l7n4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090137

Hi Brian,

On 9-Jul-26 15:28, Brian Masney wrote:
> Hi Hans,
> 
> On Thu, Jul 09, 2026 at 03:22:29PM +0200, Hans de Goede wrote:
>> On 9-Jul-26 12:10, Sudeep Holla wrote:
>>> On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
>>>> On 18-Jun-26 17:56, Bjorn Andersson wrote:
>>>>> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
>>>>> modules, but they are then not automatically loaded. Rework the SCMI
>>>>> device table alias support to make modpost consume the information from
>>>>> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
>>>>> this information, if known. Also add a protocol-based alias to also
>>>>> trigger driver loading when only the SCMI protocol id is known.
>>>>>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>
>>>> So I just gave this a test spin and unfortunately it does not work.
>>>>
>>>> The problem with Fedora's kernel-config / setup is that the
>>>> request_module() from patch 2/2 runs from the initramfs, but
>>>> the scmi_cpufreq module is only available in the rootfs.
>>>>
>>>> It does work if I explictly add the scmi_cpufreq module to
>>>> the initramfs, then it does get autoloaded.
>>>>
>>>> We really need some place to put a uevent sysfs attr which then
>>>> gets replayed when udev is restarted from the rootfs and then
>>>> re-reads all the uevent files as part of its coldplug
>>>> enumeration.
>>>>
>>>
>>> I don't have much knowledge on uevent to provide any suggestions/help.
>>> But isn't this a generic requirement ? I mean you could have modules
>>> install on the rootfs and not all of them are packed in initramfs ?
>>> Just wondering if that works for other modules, we can examine how
>>> do they work and what are we missing ?
>>
>> scmi is special because the actual devices under /sys/bus/scmi/devices
>> only get created when the module with the driver is loaded because
>> of some funtion/id mapping requiring info from the driver.
>>
>> Patch 2/2 tries to work around this by loading all scmi drivers matching
>> the scmi protocol which is known at bus enumeration time, but this only
>> works if the actual scmi driver is in the initramfs because this done
>> through directly calling modprobe() from the kernel which does not
>> get "replayed" when switching to the real rootfs.
> 
> Should the SCMI drivers be added to the dracut module here?
> 
> https://github.com/dracut-ng/dracut/blob/main/modules.d/70kernel-modules/module-setup.sh#L73
> 
> A few years ago we had to add the interconnect drivers to the list for
> Fedora.

That would be one solution. I first want to understand the problem better
though. The scmi bus not creating the devices until the kmod with the driver
has loaded is weird. I wonder if we can just move a small part of the drivers
(some mapping table) into the bus code and then just have this work as it
does on regular busses. I hope to be able to make some time to look into
this soonish.

Regards,

Hans

