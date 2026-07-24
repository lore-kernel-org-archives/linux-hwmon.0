Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E53D443A86;
	Fri, 24 Jul 2026 16:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911257; cv=none; b=ts11uluacx5x7zRCseZKfJhbd773TA5fcn/1HJjpnSadBpWJV6f60/cG9oy2ozLAENUFqD8OyYGlwbb3m7di+z3oTB/OMWGbzTRnRfjQKi1BOMz/oqU9anBpYAjl9hzWLTXMpvQUDmNdNxcKtta3xx5Zv+w6A6Uxpq7kUg5wg0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911257; c=relaxed/simple;
	bh=vH8vK9DHMVg3UqwldI0CN7ThhcabfKclNvExRUnn8T4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=rQJlih17SoGLzjNDxAHrGE+mcX9kqCzRCBB9HO8X14P3QJJyHMtX5XaW83kIZa6CBuCsNcdEoPxRlSPnCy1Mjk5ZQU4F5NhCbeJq26lDrBCvd43Q8H0aZQRMoYWIbO1xiQWH2kXMpe9ZSto+4g2ZMhRDU9VCDb9aCRMC2cW/WCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=J4wqJEow; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="J4wqJEow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1784911234; x=1785516034; i=markus.elfring@web.de;
	bh=1M4/RTVGmpY9+PD6u+l+RFtydxwbfVPvYI/9XfIAG4c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=J4wqJEowq5JVpZ/ihK97S4vH7C7pKlw2PheDLQP3uD4tE47fL2mOHYEf50wPBBGZ
	 kUVKrVdt6CLKXaUXE5Woj60UqWooQZ14Ym4iKUv/Cnu4Xk7/R/xDTvC7aZADYzSfx
	 BMIuMSjcCz3AFX2ljMBDE/2zlnw2IxDks9gebqqk1dIvAabFVzcXnHhqowwYyqPKo
	 LZ8fjwVuw7k5Ej39Ir5f1Hb3RmwUzwufSYKJdXdUxCQsQjaE5AxvaLooOtgdJt/rh
	 O4i/hR3d/G7RPhlU/95el8Qv8Lfp/xSS6l7dThuTlmnODEQU3F2qK9tN8cUs/NeAp
	 KWbtRB/1DHiSh7TElQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MiuOW-1xRqIn3nzY-00fzma; Fri, 24
 Jul 2026 18:40:33 +0200
Message-ID: <2b6431b2-62f9-4399-ae20-bc90d4b04b5d@web.de>
Date: Fri, 24 Jul 2026 18:40:31 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Jardin <vjardin@free.fr>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260724-mpq8646_v0-v5-3-5915b5ae9aa2@free.fr>
Subject: Re: [PATCH v5 3/3] hwmon: pmbus: add MPQ8646 driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260724-mpq8646_v0-v5-3-5915b5ae9aa2@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BYWuz92qmND5ZRV6wiY37BDyxdpL1m9P3SY6tpS0xO252c3kVFG
 vfbcCsd1qSgjj/SLwwlvE5+OPThE1tMZBD5aRB4eQ5t9AyqH9WtPzHG9hJb2SDwT4MproSi
 HddmSWZ0H3hzeDwvMzRezVRSgjIfavc9MVAMOufceHB44iTrcwe1YlPSKRfHKd62hIPUysm
 hlFulepFaH/KUKRJ94deA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NgVLmnBXEVE=;W6nsvO3+Jzd6nn1meQoGNXMhKC/
 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
 YwVcowxzX077YLswhkVET

=E2=80=A6
> +++ b/drivers/hwmon/pmbus/mpq8646.c
> @@ -0,0 +1,1253 @@
=E2=80=A6
> +static int mpq8646_dbg_probe_smbus_rword(void *data, u64 val)
> +{
=E2=80=A6
> +	mutex_lock(&priv->mps_lock);
> +	rc =3D i2c_smbus_read_word_data(priv->client, (u8)val);
=E2=80=A6
> +	mutex_unlock(&priv->mps_lock);
> +	return 0;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&priv->mps_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v7.2-rc4/source/include/linux/mutex.h#L25=
3

Regards,
Markus
