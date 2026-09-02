Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A903876BB;
	Wed,  2 Sep 2026 19:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376760; cv=none; b=pOVkYZ7LlTXroGn+VscSvM+a49Etg20nCw3kCQYu7TEwf7xAm5jJpH0rhmFVPT9CJqKYSa2LqAUonbLPSjyk8/jwVb3745MTAoaiblly+Rn5d9Kh6qapU+AUZie7Bhnri/pZhzEWszFZ8SybN6p2O5sN+q8o8oU7xKlqY5Gynyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376760; c=relaxed/simple;
	bh=WTQPxQb7nIgr0/QgVgFCRMJTTWfTizMvVtSCMlx7GTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rd+y47MPruGtj2iUiFlZePPL4NvG1qt3sNVq/wBimSJGWqyfc+gMmiHc6DG1KhUgnAnF/JcoefkOum60koAS+5f8BG/MfJ0x2lnAjO+GHDRU712zzWjvW3gOX9IryZsIJO0v84yTnuOCJGcvD8jiFYbXRzci7wFYFB/WFq+fB1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=sO0BhB5U; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="sO0BhB5U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788376756; x=1788981556; i=w_armin@gmx.de;
	bh=WTQPxQb7nIgr0/QgVgFCRMJTTWfTizMvVtSCMlx7GTU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=sO0BhB5UeW537aPQ7WwdovVo42wot+rOcf04BcnBlipixBmVDq8WZ8cfWWEZLwfs
	 vqzO7RZbuo+VidHdwzOIzJIow/r9cHaTFxmoY7V5PlpBgEB2WSgZv3Gs4ikP/zvpa
	 GI1D7wBnYHHQUEDeut9doVwAltXwRBm0WvaaA5zj9Yz/rR/D5Hd0fxLhFYfRpToCF
	 vqqgicIPfXpue1tKqmRFvmtQTW4pAqEeaXhd6hxPd/nkog89f4HCLztFg54PyVz0e
	 bvcwWQS3WfQ8Fbcmi5I/mWcn/BKm97GgQRLrc0rQSh0QjvBvc8RuWaXUlMZdkDcTu
	 xvNtbhgdD9NAQC/YWw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTiPl-1xRJzF05Hx-00IprG; Wed, 02
 Sep 2026 21:19:16 +0200
Message-ID: <57a05dea-3cce-4ecf-bbe1-ab7464f8c224@gmx.de>
Date: Wed, 2 Sep 2026 21:19:15 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Matthew Bettencourt <matthew.bettencourt@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
 <014b9438-e9b7-4be1-b816-002e83a068a0@roeck-us.net>
 <37132c40-aa82-4df1-b5ce-337601f3c085@gmail.com>
 <3c4e9f59-5272-48cf-a4a0-eeefcba955a9@roeck-us.net>
 <763a8b30-8548-4ff0-a1e9-8e74bbfe9b02@gmail.com>
 <6e8761aa-67ef-4624-834d-4b9d0ce729d6@roeck-us.net>
 <9753ed80-5666-42a6-b04c-99b9ef9326fe@gmail.com>
 <5c17ea39-c479-4f88-adc6-9a86f3dfb96a@roeck-us.net>
 <d80cf68e-a6cb-4b0b-807e-313be29ca8ae@gmail.com>
 <49cafd78-2468-4b43-a376-a8b2e2de2c19@roeck-us.net>
 <11de1daa-702e-419e-912a-db37c9f28e92@gmail.com>
 <67938f6d-d60f-44cf-9b03-fa472c8a8499@roeck-us.net>
 <65336f12-b821-449b-a637-31972807c676@gmail.com>
 <a953dcaa-cfff-40c8-85a9-c12601e49e85@roeck-us.net>
 <9cdf4b63-8f99-4a80-b0be-3f3df69e526e@gmail.com>
 <46191fa9-fa4a-4c16-b618-2c0c6dc09102@gmx.de>
 <531be24a-bad0-40f6-8e30-3d4da565afcb@gmail.com>
 <a2efdc40-c73c-4892-9fea-9470c0f9823b@gmx.de>
 <0388506d-9ddc-4825-bf28-95c8eef219b6@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <0388506d-9ddc-4825-bf28-95c8eef219b6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:z5wsjzmPC4GVWicGTFT8ilavUjmkZf+48i+EmYDsTCbaw9Mg4Ba
 X4NsFvaX6HhmYKLj2HcTkoPIhZDxLudE7jAE04z7jyCABJMv5jYZFBsn4N1CE6Xl8d2dvuC
 Gbfbrf2QvbfkZWa2vj7HSNiHcwXJU7ePgeLYAJicVzvr+NqrlOPn4QuTuzRiTolzRjxAoul
 AcMqILVoA3nnf4dqKN3qg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uw/8U5kWERI=;8BAJO7hPymFjEYBLYDDZPDW9oPR
 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

Am 02.09.26 um 19:28 schrieb Matthew Bettencourt:

> Hello Armin,
>
> Here is the acpi.log file as requested.
>
Thanks,

i suspect that the BIOS tries to use a PNP0C02 device to tell the kernel t=
hat
the SMBus controller is being driven by ACPI. Can you share the content of=
 /proc/iomem
and /proc/ioports (with root privileges!)?

Thanks,
Armin Wolf

> Thanks,
> Matthew
>
> On 9/2/26 12:22 PM, Armin Wolf wrote:
>> Am 02.09.26 um 19:08 schrieb Matthew Bettencourt:
>>
>>> Hi Armin,
>>>
>>> Are you want the acpi.log file or are you asking me to print out all=
=20
>>> the .dat files?
>>
>> Sharing the acpi.log file as an attachment should be fine.
>>
>> Thanks,
>> Armin Wolf
>>
>>>
>>> $ ls -1 | grep -iE ".dat|acpi.log"
>>> acpi.log
>>> dsdt.dat
>>> ssdt10.dat
>>> ssdt11.dat
>>> ssdt12.dat
>>> ssdt13.dat
>>> ssdt14.dat
>>> ssdt15.dat
>>> ssdt16.dat
>>> ssdt1.dat
>>> ssdt2.dat
>>> ssdt3.dat
>>> ssdt4.dat
>>> ssdt5.dat
>>> ssdt6.dat
>>> ssdt7.dat
>>> ssdt8.dat
>>> ssdt9.dat
>>>
>>> Thanks,
>>> Matthew
