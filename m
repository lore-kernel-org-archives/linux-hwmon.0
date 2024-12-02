Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EB51FE461
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Dec 2024 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733149275; cv=none; b=cePU9GGER0fUitn4mzYTF3mOGh0/psD3rummRo9t88LAL3F3kHhEZLFq23jHjIiTgFSaDQ4mqGzewVpm+/EBJ/LEiAZZ5dED/SLoHnc0HGGvZ6Aam2VYQ/sgKef0nFkIAL0huZbMkWQbBk+7UDpGcmKNJGZULhf1ZFd/EnEHEco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733149275; c=relaxed/simple;
	bh=Whg2JQMlNNDEsQt9H0MFW06uMZjKJ9GcJi8b47Et6AQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AXP7Vck3U8GQRVwF9EzaUZZhhg9mIprE7ajKm9/Wx8aksr7o6uZOwWrA00U3piWz2UujtifJuRoXuLFadV2TPBTgJoqBGw9nL+RXS8eCJBRrT9jZgKqCPYeYjndOQVc7ZofXem8NxKtDXhFl8OWefpNtOChAa/e2Fjz9b31oVVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Kd9a4Jz+; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Kd9a4Jz+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1733149268; x=1733754068; i=w_armin@gmx.de;
	bh=Whg2JQMlNNDEsQt9H0MFW06uMZjKJ9GcJi8b47Et6AQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Kd9a4Jz+gxcYyJlWTmHkja61eZsJi0XJM/Cw/hxnXQOJJhNfvGazyMXFyIZuFMc4
	 xXrlgek20INHntKGeKjZ45/2HpgL3d7YbyJA+Pe2/bB3brMIhxiEJ0MThk9aZmFCN
	 SDGqkWbmYCFQNJHYh6kZw49Ns7RKz5C/cyIcLQEmdOBlilrJH8zgAFKkEZpOh+evH
	 YeGuLFbzNH2aUqRpcXqMGwbU21BIptCS+00h5+lCMMmfKW+9oo3necYRRnYxFeviD
	 FyKpLOpeH3rmI+9NDcWMV8secOPQouodNE7tpKIHEV8Po8qiOT/3rqnQKGcWXt57W
	 kwFOX8ur/lIeMDB8Pw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([141.30.226.119]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXp9i-1tAPeK0vIy-00Lifo; Mon, 02
 Dec 2024 15:21:08 +0100
Message-ID: <f7a4c4da-36ca-487a-839c-7f23b2caae08@gmx.de>
Date: Mon, 2 Dec 2024 15:21:07 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug report] Regression in kernel 6.12.1 preventing asus_nb_wmi
 from loading
To: Edoardo Brogiolo <brogioloedoardo@gmail.com>, hdegoede@redhat.com,
 linux-hwmon@vger.kernel.org
References: <0bc76531-d88f-4288-8a3c-023dbe04dfb2@gmail.com>
 <06787c88-5f04-4ffe-bfde-829edcb553f9@gmx.de>
 <ab155793-c2a6-4ee4-9c7a-2209c66143d3@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ab155793-c2a6-4ee4-9c7a-2209c66143d3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lmpCZXwfVfndHoh06qSO+LzBqpCLBxaDNBd/JAmTIP7M6G+bCek
 VceXPvMbUqC4VBOR8z5egHlh75/1BWgmPscc7tEA2A8zxdC98LAuOIY1hTKaOLTaiYpkaQB
 fIaXvoz+AbbKl2PDEgl4XlY5ehHc1XgWs4OezNlt6J/GXYW6bWHvDkL30MhjJLzNbxWNPHY
 s5j1Y5HRbfLvhc3l3cP1A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pk6u84n1xm4=;tWTUAVvuJTl3lXAK41t1oCSJpxC
 u8n1slQ+12knpO4p8KycI36fmgac/6APqSVzxdOVLcKwHwi28sakM7V8Kd0UxUEt5RMpFAgzM
 AqMs90ofp0EhvgxubkF68Rq1Sf2kMiJ8jzR+JuUF/h6UO0QK2GpSt4uB43aHZkz1Ot6Dv+7Nz
 Wl/DiRIyfgAi2S0f3ZIqSPzcMX6l5MhjYq6KntdjNKIM35pS94NnnLnB1jGWu4QdUCj4Rb1XR
 /2MhrQJsBC7XIFfsC9t3RfkI9OnC+N1/7CSNAgCUlAigayUx+V06Do9VtLyGrfPBZ2JaUhH7o
 h/pxwW8jmQ+b8mnGaDHrAOAxH/hpcNXKKwmLC9RWi8ecoFlLsb9mz1gArj1mbZGSNbiJppypM
 rTMJZG57GUlMA5TCRon0us0lzkHHOzGL4JZ0pmOLuGxRQ9gI2unS4mkNaVJ4spCxsAK2EPnxF
 SYLKr88D/3iuJSEno8MGIimZSl1cntgwK21dun4dEcNNZnlX0AdQCtzQRNl0C/FOVb1sYKIz5
 orUdX5hSb/zfKs+YtN5yZYbUX8aIhnPa0SzNbMOJkk57hZb/JRqMrUehnwB8bqCSot5eZjWpR
 PVHaIRtvQNSiS5i60HAfbHMvodQLU7//4GoGG6M10kxeyHDQV05G4HIQZYT/x1FbjocpL9nJE
 2B3CY16gdcyX+szBBR8aXa3NvBZXAWTSRce0F3sMzuhLi5wcSuKJKUp6hGsGH4B/OW7cDc4H/
 Q+IRWFuo8cLo+Ba7B0MxGmM7hIhrD+kiUbNB+TrcSE9r9be+QFbMMdIlG04jRkFMedJT52brF
 RzyhQ6ibGHF73SO3vuaCb7bS2b4tQQ7XmbFs0nWwWvsyRK1IhmsogSTipc6n9omoacCaQYq01
 p187Z4ENfeWjjQoEBdkQddCd+v3v9FxOs63mj80Vl54+drJmUpb4fgc3jxIGa5zDhd6rHde6k
 458GuKPhJv33efYGLb+BKiPCOuOspD1tw0/FTmP97vzX/q80vqKjJ/CoOtD8ufC/UKzlgr3He
 wCwu7IaUyOfEPl9gipv6Xm2+dCN9XpkWM0UDQFwEbplzitpWsFozRHv17xCLsJhZq3fkXRaHE
 zYtcfGyoXgsG2T9hyeg4vNoFO7b2a2

Am 02.12.24 um 01:56 schrieb Edoardo Brogiolo:

> Dear Armin,
>
>
> Please find below the acpidump outputs for
>
> Linux 6.12.1
> https://www.brogiolo.eu/nextcloud/s/NFPKR6gPErTAnnn
>
> Linux 6.12.1 with patch b012170fed282151f7ba8988a347670c299f5ab3 reverse=
d
> https://www.brogiolo.eu/nextcloud/s/NePsSABrnHTfQNf
>
> I would be happy to test your patch at
> https://bugzilla.kernel.org/show_bug.cgi?id=3D219517, but lack
> experience compiling the Linux kernel.
> How would I be able to fit the diff file in the following step-by-step
> guide? https://wiki.archlinux.org/title/Compile_kernel_module
>
> Thank you,
>
> Edoardo
>
After looking at the ACPI tables, i do not think that you need to test tho=
se patches again, since your device has the same issue as the device from
the bugzilla bug report.

However if you still want to give it a try, then you can apply the patch t=
o the linux git tree using git am <patch file>. Then you just need to buil=
d
the x86 platform drivers (make M=3Ddrivers/platform/x86).

I will try to get the patch upstream ASAP so that it can be included in th=
e next stable kernels.

Thanks,
Armin Wolf

> On 01/12/2024 16:46, Armin Wolf wrote:
>> Am 01.12.24 um 11:40 schrieb Edoardo Brogiolo:
>>
>>> Dear all,
>>>
>>> I hope this e-mail finds you well.
>>> I am writing to bring up an issue I have experienced since upgrading
>>> to the Linux kernel 6.12.1:
>>>
>>> I have been unable to set max battery charging, keyboard brightness,
>>> and actioning special keys (micmute, enable touchpad, etc.).
>>>
>>>
>>> With the help of the Archlinux devs
>>> (https://bbs.archlinux.org/viewtopic.php?id=3D301341), the issue was
>>> found to have been introduced by
>>>
>>> kernel patch b012170fed282151f7ba8988a347670c299f5ab3
>>> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3Db012170fed282151f7ba8988a347670c299f5ab3),
>>>
>>> leading to the kernel being unable to load=C2=A0 asus_nb_wmi.
>>>
>>>
>>> Reverting that patch fixes all of the aforementioned issues. Please
>>> see the Archlinux bbs thread for full logs and steps taken to identify
>>> said patch as the cause of the regression.
>>> While I do not possess the technical skills to help developing and
>>> implementing a fix, I would be keen to help out testing possible
>>> solutions on my hardware.
>>>
>> Interesting, can you share the output of "acpidump"? Can you also try
>> the patch proposed in a similar bug report
>> (https://bugzilla.kernel.org/show_bug.cgi?id=3D219517)?
>>
>> Thanks,
>> Armin Wolf
>>
>>> Thank you, and kind regards,
>>>
>>>
>>> Edoardo Brogiolo
