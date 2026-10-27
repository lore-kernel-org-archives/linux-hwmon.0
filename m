Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109995;
	b=cknlw9yEO1Y7Onl6LZken7NDwV5Gaqxb5aU+InB50FvfEsjlFUxIoTeEIUhM9O8i5zDx
	 q1tlK7ElTCCyF/3KmvfJRcxWzrACnOrFl4SSbjn71ApPRmAhPaQTamlzjA7TkALpWImDF
	 dgkdFG7v/1DMJjhF26zA96rABdsPKl6qfGg3CV1pKBFDy0Q03sC6Fcp3HXWAdyED/z7Ky
	 pKZgNVKh3P8LlJfJUK4209jcK4pbPk9tJX/HDKlQiCIPdt+EqRUv48oWie/OeBAb2DKVL
	 aenT6oAO2fmNNJGS33SeKqGbvthu4Us3pUB2YUH9YKmhEIon7WCuK0Na30FydQozHaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109995;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=ngY32Jt9QPGZSTlFXtTgTm8s6NAGNxB6e/Z1Utv4++A=;
	b=BLGw8778+pJDPRG0YTZDSO2jXbbvd8M3NtlozHS4XkfceHZZEW1++ufIt3P+spZLoUAp
	 L9qXbiXQj+AEyhy8YjwrNuJf9jA4DetUgeeToXHvo3UIeCws7F3ssq7QM6Ut2CgVBcogx
	 3QK9ihhElZ93cE4XT93LabZ14Ddf4/egaOXnXRqL/+xX6t4V/lGLu1pR7xXhNiQW3Czlu
	 2gakFQKYBPF6lV5vzf/zOUu+3O5n4qxLCQy7C75jiyNAqvR8cD5rhDXmm2DXAK1qbEiBu
	 uezOFTQITYcBITiIxLBQuymxLGhsyemzIbflQUXvglZHnOrP7zhM5aKxfplpY3IZFDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=takSi8BY;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A46C606A31A
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 14:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A46C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=takSi8BY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793109992; x=1793714792; i=w_armin@gmx.de;
	bh=ngY32Jt9QPGZSTlFXtTgTm8s6NAGNxB6e/Z1Utv4++A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=takSi8BYh1JVGMuHCZqT0eJ2Li1AK6btTazcGdapGZukEbpkKp+D/xVZ3nQpbbCI
	 p1LqyH2uKQth308tmF4Yx4a1T3XMhL9v3Z5ffT7mWiuBlfHz0DcnOfWCW5Ufyb8O1
	 etKe6CwrMsV7Y7Qyr+RCCmAZsNDUmBkaLU2Ku66XsQFyfQwhLgUzCnxrnleQSInA9
	 ed/uqNzueYguHCRwmNK15T7JJfrhQ5zQPwhgGqfDUgQNMGzW+p/wg9db0qShpmeal
	 VKKn56K25OwDcl1fk7e/1naarlDurn5PZv7+junABC9dJpfji3GE+CdKgIjQyZRxE
	 Apk71zgbHeQD0UVh1g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6bfw-1wUG181GiU-00qpFF; Tue, 27
 Oct 2026 15:06:32 +0100
Message-ID: <6be33528-a1b1-4aea-8cd5-2086a430bbde@gmx.de>
Date: Tue, 27 Oct 2026 15:06:31 +0100
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell Pro Micro Plus QBM1250 to
 fan control whitelist
To: Guenter Roeck <linux@roeck-us.net>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org, serjo32.games@gmail.com
References: <20261024035735.6810-1-W_Armin@gmx.de>
 <95b6055c-27ad-4e5a-bbfc-87722600b20b@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <95b6055c-27ad-4e5a-bbfc-87722600b20b@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Zu9VQpm2h+KjiqHxWs2LXMyC79LAzjGEF65uxUmYIxDvjiJuuMS
 6RJ3JtqBzh2NLIJLxItQtoGudIutQKqNZ/96WWOPN4zZ/Pq7R2aERT243IRD5fCOowa7Zdp
 iBPN0wTnUcFIfh12R0RvflCMua7US7d3vSSrdpfFOfr6sjHQzH+3Fbpkr/+3CVYi8uHaZ8O
 PaLr9x2M2VXiLq7Wa9rkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ylAcqOQ0YSM=;DEDoeGXCj82EKNWXxzo3Tl1W1w0
 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

Am 26.10.26 um 01:18 schrieb Guenter Roeck:
> On Sat, Oct 24, 2026 at 05:56:45AM +0200, Armin Wolf wrote:
>> A user reported that the Dell Pro Micro Plus QBM1250 needs to be
>> whitelisted for the special SMM calls necessary for globally
>> enabling/disabling BIOS fan control.
>>
>> Acked-by: Pali Roh=C3=A1r <pali@kernel.org>
>> Closes: https://github.com/Wer-Wolf/i8kutils/issues/20
>> Co-developed-by: Sergei <serjo32.games@gmail.com>
>> Signed-off-by: Sergei <serjo32.games@gmail.com>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> Tested-by: Sergei <serjo32.games@gmail.com>
>=20
> Applied.
>=20
> Thanks,
> Guenter

Thank you :)
