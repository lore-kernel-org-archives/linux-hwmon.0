Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AF237C0FD;
	Tue, 17 Mar 2026 20:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773778310; cv=none; b=NoAgX/rvzXTVKMpsa5d//I5WRcSPL3u0Gc+KbDk9KHJcDSWqetlaBYODxbefzfYgaB6BnkHJzbqi6Nq9/5wz2nJNXbivkoERCBt+nhqB5x93aQO2JBTSTgev4BlM0n5jav0bX12J/QA3l3F/LeobWE1G8tdVpqMhUobNr3FCRUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773778310; c=relaxed/simple;
	bh=gsb+15dC+Fj6OcnuL2uhktCQQrcMGYUlCFtqXAckdVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHpl92wc1nR/RCjgj0WPMForjiTnKgGvnAUpsBR0zgS7cuz+BjzG8teilvNwb4PMhdePJvaCMqVIIkrCE5DEUDGN9t8/+AfbptxhbaEun4vpp0R2Ni2HjdD4FgPQ6DiV5gsO7QV4l+WIWCNAiNZbnFtoCJ7BP2espJn9+eaxjmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mdQxax9Z; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mdQxax9Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773778275; x=1774383075; i=w_armin@gmx.de;
	bh=gsb+15dC+Fj6OcnuL2uhktCQQrcMGYUlCFtqXAckdVs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mdQxax9Z/ELaGnWvucMhtrzx/k+0yAjkfrVAIy/S/h2/jGNNyH4IITWST5EPWZqA
	 TDlMqkSjLcDglrZoxQhjMA23VgCmahsF5aSPOfglBjlqv+l646Oo3ZIBr45Fvlfg+
	 x//h5T27DOQNFjXtaf/3eA5/3KUSkA4iDpZatDlI4edygDPo2jUWQKlyOhxWt3eh0
	 ho7Pw5/C4pex5aTeOltv/Ejqlyn8GIMwtVhzt8L0/760Gwne5fE6UNnKb7qfJqumk
	 lehjfcNsTErz6/g0O3xVjy3K87GSO/MeX21gCBHHGnLFzglvIVA62uYaSFPAduFz3
	 l/7DX5a6TmY842wwxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVNB1-1wCnTQ0eBT-00O7HW; Tue, 17
 Mar 2026 21:11:15 +0100
Message-ID: <52dabfaa-cb3c-4c2f-92a0-efaa175bf4be@gmx.de>
Date: Tue, 17 Mar 2026 21:11:11 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] Convert most Dell WMI drivers to use the new
 buffer-based API
To: Guenter Roeck <linux@roeck-us.net>, Dell.Client.Kernel@dell.com,
 pali@kernel.org, mjg59@srcf.ucam.org
Cc: soyer@irl.hu, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
References: <20260314175249.16040-1-W_Armin@gmx.de>
 <502ea01b-e5e1-45a2-b5f8-ad236dc8f006@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <502ea01b-e5e1-45a2-b5f8-ad236dc8f006@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:udtRzCCpS8fcCG3mfxIJGWEx6m8AlhT+YDafZLfZjakk1Ex4orM
 9TRsERlR61lSx/8WR6zIzNoC23bwGrWJI8dIMC4C7BGkkH2PqQfrVaOO/swpRngVQcbjfka
 03ZJal6SMMX2y7PmbZ/j8y9Mq7s0lksYbOLYNs3yaZkRErudGANjmFXtSU0PaewRC4jvhd+
 Zirk1MJajTtEuHpSr5/3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:97R1tnHiDOQ=;ttLBk8dfblGmzRW978PwbqzhC0Z
 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
 XKjjCIhkdl7Kcra2fGgx

Am 17.03.26 um 16:52 schrieb Guenter Roeck:

> On 3/14/26 10:52, Armin Wolf wrote:
>> The new buffer-based WMI API improves the compatibility between
>> different ACPI firmware implementations by performing marshalling/
>> unmarshalling of WMI buffers like the original Windows driver.
>>
>> Convert most Dell WMI drivers to use this new API. This also
>> removes all ACPI-related code from those drivers because the
>> new buffer-based WMI API uses abstract WMI buffer objects instead
>> of ACPI objects.
>>
>> All drivers have been tested on a Dell Inspiron 3505 and appear
>> to work normally.
>>
>> The last three patches contain some misc. cleanups for the WMI
>> driver core itself. The most important change is a fix for modprobe
>> to verify any WMI GUID strings from WMI drivers and convert them
>> to uppercase if necessary. This should fix autoloading for WMI
>> drivers that use WMI GUID strings with lowercase letters.
>>
>
> The series doesn't give hints to maintainers if the patches should be
> applied on a per-subsystem basis (i.e., are independent of each other)
> or if they need to be applied together. I Acked the hwmon patch, assumin=
g
> that it will be applied through a common branch. If the patches are
> supposed to be applied in subsystem branches, please let me know.
>
> Thanks,
> Guenter=20

I would prefer if the whole series was applied together on the platform dr=
ivers tree.

Thanks,
Armin Wolf

