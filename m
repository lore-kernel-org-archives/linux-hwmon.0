Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282933;
	b=Lad3LHgbvbk9flwMEYbDKtrgepeOjW+ct+ph9DR0jq8mU7UFp67c4SP4jdgy8sU6S3RV
	 tWqVb9RfIvhT+hn0HFGFEGK9FsleOqeF2ejsH1sSCkc+siTBJIy9tii7BMt2IplUy/0WQ
	 Tq1fltdXTrwGoJlVmDDIXBJvCbRjqx8pL4mFvSEG5X+4Ecl44Zi3YwzYcaYczPHJEk/k2
	 UOE4Fj6PbiCsqN4BhOaCy30jkvmHoqCKPo3a1ssihUQp2bG/K0cJ4lwntmbBjAszr6cm9
	 fsGWmRJHdeId51FkbF94q6BafGLNruda7edZS9OUZCZ0qLU1PYr3iGcU8jEbHqRO3TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282933;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=sYbXStySUKbUfq6iKNWo7/Ep3DQqWgQraJdcO6xPInI=;
	b=gakowK77kOuUNzU9WGHd+WNqUXA+vMKwIs5WefyIJjKPHBWi+qVocGlCfLeL8SRxt/HD
	 NGTvY2K9EvWHWQo+9z8QuHGUbvVvkvmMFNJ18VtzCtWxVsmb2O4dsYmRJc0VndZppy4um
	 4BBE48eyQkeFPEEaOd3eEa52fxjJVVqt5A8oSDY1b/EAzudptDfkw84NW5CnMVMpqxGoq
	 LyDwJZglHPzmQIs3eipZmUFLuQ9Wi7v0sht36nvIOMg1pibOaxYeQaYP5RKGgizpQaZH7
	 Zn6o8oUBdlqJKED0Ub4C+ISBHdrZ4t3AJgg0ty7zwOrE/HTG9I9iCEf1EjJv9DUwZqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=BdpfmZ+a;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBFF606A33E
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 14:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CBFF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=BdpfmZ+a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793282929; x=1793887729; i=w_armin@gmx.de;
	bh=sYbXStySUKbUfq6iKNWo7/Ep3DQqWgQraJdcO6xPInI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BdpfmZ+ass91SRYQ1Hso/C7sxc5iUmJ65kiA43jl22mGwf5gblD8hnXobyCx/fWF
	 8BxD7A0tO4U3kg7fSWbpVGGJgOEESfZbq6OYl9UfbePb3HtnX0ht4yMHP9pRZn3ZT
	 ck/BolLcx8gJ5YhMvx9fYQy5gyvvxU5Bpy793fk39t0I1/tk49aUZZq4RvCT1RcmX
	 kKioxAZ/cYHQD4pIX5CYBJq/v95eJENgUV/vMZKzSXwr5OKq8v3an6Aq6clZNNp4F
	 Vr11KZTFMBDvSjZMMmFGti2hrULMvwE0W87PUdyLeq3JlL9YB3/MEibSgcgRxghZ+
	 THuS7CppaIi8i5y4UQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M26rD-1xOMcS0VAX-002TYP; Thu, 29
 Oct 2026 15:08:49 +0100
Message-ID: <650722d0-5f7e-46ab-9044-5fbb133a7967@gmx.de>
Date: Thu, 29 Oct 2026 15:08:48 +0100
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
Subject: Re: Precision 7670 SPD5118 resume -ENXIO with confirmed SPD Write
 Disable: supported temperature monitoring without weakening protection
To: Mike <mikedeuchar@gmail.com>, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org
References: <CAD2WtuOZEtLGkncdKA45T7mV+udX4jt7cZpqqz+xUZ_Z9UVGsQ@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAD2WtuOZEtLGkncdKA45T7mV+udX4jt7cZpqqz+xUZ_Z9UVGsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gKPa68LMo6CEhHG35IVVLdXkrCu9Eug7hI6Lap9YXjSnNXBpCYw
 vX0+9iu3ErJ3Qr8B3cPU64hkCYB8ejHs3dqdJEcivQiM/PcP2TorxJ7X3s3+SbAhw4BFznC
 csp/DgybFh9H3jmpzg9rGWV52mHCqB1qlmi/GHC1q23Xtq9Z7liSueTk8Xdfnbyj8lvgEEg
 EA71Cud1vw1w6TbVE91eg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cg+mX/X9tRY=;ole/gnLSWiJjrOqN31dWJwzvswL
 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
 y5E=

Am 29.10.26 um 12:31 schrieb Mike:
> Hardware: Dell Precision 7670, BIOS 1.41.0, i7-12850HX, original 2x16
> GB DDR5-4800. Passed Dell advanced diagnostics preserved. Kali kernel
> 7.1.5+kali-amd64; spd5118 in-tree module.
> Boot: i801_smbus 0000:00:1f.4: SPD Write Disable is set
> Boot: i2c i2c-0: Successfully instantiated SPD at 0x50
> Boot: spd5118 0-0050: DDR5 temperature sensor: vendor 0x06:0x32 revision=
 1.6
> On each of two completed s2idle tests:
> spd5118 0-0050: Failed to write b =3D 0: -6
> spd5118 0-0050: PM: dpm_run_callback(): spd5118_resume [spd5118] returns=
 -6
> spd5118 0-0050: PM: failed to resume async: error -6
>=20
> Temperature sysfs attribute readable after first resume, 30000
> millidegrees C. This is not independently validated against
> register-page state or another thermometer. No direct SMBus write
> tests performed, no protection changes, no module blacklist.
>=20
> Aware of maintainer concerns in August/September 2026:
> read-only/skipped-restore proposals cannot guarantee valid sensor page
> selection after firmware activity. Neither proposal installed. We
> require protection and reliable monitoring retained, not silent error
> suppression.
>=20
> Request: is there a supported firmware interface or driver design to
> validate sensor register-page state and provide reliable read-only
> monitoring on this platform? If firmware cooperation is required, what
> specific documented behaviour should Dell provide? Please distinguish
> unavoidable read-only limitations from a correctable resume callback
> error.

Dell could either modify its BIOS software to not set the write-disable=20
bit _or_ it could expose the SPD as a ACPI thermal zone.

The upcoming 7.4 kernel should contain a fix that disables the spd5118=20
driver on platforms where the write-disable bit is set, so the error=20
during resume should disappear.

Thanks,
Armin Wolf

>=20
> No unsupported kernel patch proposed as a verified fix. Local
> source/log evidence retained. Device identifiers and raw reports
> omitted from this draft.
>=20
> Related maintainer discussion reviewed:
> https://lists.openwall.net/linux-kernel/2026/09/21/1921

