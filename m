Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0453F99E5;
	Fri, 12 Jun 2026 16:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281965; cv=none; b=RT5EMfmbh/WGGysOtS48jSAUfQH8+zRxIrTo1Wb8w4o1qfPp8US/xoWsZoSGgeVRUSM+ckXj5ABm9+r/auY/S8SqUxrlxeznm2MGj9nkFthi6lRK6wLq1KFDXpeZe+yHddcBuzFCGUXf/5tL9ittf1kBG4np8l4RHzkYjl6+kJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281965; c=relaxed/simple;
	bh=a0EoiV+8j+lhuTulc+7YsaVkPsUzR25lpsM91lPhA6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JfHuKfzwfBgbVn2L1iXQpfMiTQrWrS+d/XGp1lPN7RAxSsPqC137ro0cqhN9XJTPQd/NzqGa1qPxW5A424ayJluu6Cc5R0UdwZaolfw/Wsrzqjwq0aCUrRYJXwyVXuhlv4VSfQJaaUNW7k3vLkkhSA4NdslulE1qPhlxgZEOkEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LAfxwgRd; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LAfxwgRd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781281946; x=1781886746; i=w_armin@gmx.de;
	bh=BMJHbU7daJlzERvsvqHGN3YH3nwq+Ikt0maGVp67TYM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LAfxwgRdtaORqxvcSSvmbh/2VbwISeBWPSPamlrDcWhzI98yG3AYi5v3N78HdHaW
	 FzqBW7kRoowop/iL6Eh8NIXQ7Xl+Q/18jl/K3TseEVvku8nM4MyAhrDk5vC3Z+BUl
	 x2MK03BY1AaRXgPA4i0G2uQ8MVuZ9S2JhEjbYwv2ldtg+hpIjdV0B23LRXYiwef3V
	 4Hn7w/hRS04j/zASq0Vo3QiNF2ri4WQAaSN8O1oNbN6EWHG+8WFxTxU3S3u+pOKw6
	 O35WX9y+nnFO6mPPaCnnRw2Bq45W7hLjRArbbmoF9OdcQVzLPYOCIoeHdeo+1YHsh
	 s4/rLctIyYGOicH/fg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfYPi-1x9bPO21NI-00f6YD; Fri, 12
 Jun 2026 18:32:26 +0200
Message-ID: <4889560f-3f6e-4ce2-bdeb-aa2cc9bcf826@gmx.de>
Date: Fri, 12 Jun 2026 18:32:24 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/9] Convert most Dell WMI drivers to use the new
 buffer-based API
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org
Cc: soyer@irl.hu, hansg@kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
References: <20260610203453.816254-1-W_Armin@gmx.de>
 <178127019722.31486.6141646420423582072.b4-ty@b4>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <178127019722.31486.6141646420423582072.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jz4hSNtcZlNVf3bu4J18UvD1v1Fd4PiQfSyn+7NDrRwltaZV/S+
 R+r+/mpHmKzOhLWQKDo4ny7Q6hy8BMGeoOcMSFg28wM57sjrxcHQbTVk/8NNh+0WJco1FQt
 G70Ve8kPcHs+Zr4B2symGG4ZAzaT6tWmZrFna+6bFhVYFkKsQ7W7LgvchDcMZrqilhJJ7UG
 SbTM0NiWdTdNGaPLmIr+Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WAYaSetsDLs=;mnqF2RqXWwZcU4wzZclZa2wG1dA
 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

Am 12.06.26 um 15:16 schrieb Ilpo J=C3=A4rvinen:

> On Wed, 10 Jun 2026 22:34:44 +0200, Armin Wolf wrote:
>
>> The new buffer-based WMI API improves the compatibility between
>> different ACPI firmware implementations by performing marshalling/
>> unmarshalling of WMI buffers like the original Windows driver.
>>
>> Convert most Dell WMI drivers to use this new API. This also
>> removes all ACPI-related code from those drivers because the
>> new buffer-based WMI API uses abstract WMI buffer objects instead
>> of ACPI objects.
>>
>> [...]
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.

Thank you, i will send a follow-up patch for the dell-wmi-ddv driver later=
.

Thanks,
Armin Wolf

>
> The list of commits applied:
> [1/9] platform/x86: dell-descriptor: Use new buffer-based WMI API
>        commit: 0f2d6a308210caaa5e0ebf9c085d87f4a2c06bfa
> [2/9] platform/x86: dell-privacy: Use new buffer-based WMI API
>        commit: 1719340487e63da13f2ac25e488c72737a545772
> [3/9] platform/x86: dell-smbios-wmi: Use new buffer-based WMI API
>        commit: 6f918e3d95c9b0b4e6a6881692a9b5f9bf0f36b0
> [4/9] platform/x86: dell-wmi-base: Use new buffer-based WMI API
>        commit: 982b0e683aa3b1d20b1512cde53207ba1c80e22b
> [5/9] platform/x86: dell-ddv: Use new buffer-based WMI API
>        commit: 7fced293bbd00ee8d20eaf4654849ac9ff332973
> [6/9] hwmon: (dell-smm) Use new buffer-based WMI API
>        commit: ab1eb37dd63ff3555e4f98918f1bd3498522f765
> [7/9] platform/wmi: Make wmi_bus_class const
>        commit: b79ad5e8ba5cfda93a83e0cf71d4743829cc9f83
> [8/9] platform/wmi: Make sysfs attributes const
>        commit: c3cbac4be03d769571f32e7f27241b2c58f722f5
> [9/9] modpost: Handle malformed WMI GUID strings
>        commit: 3429ae7b2f02a4a6ad40d36ee06641d433d75a1b
>
> --
>   i.
>
>
