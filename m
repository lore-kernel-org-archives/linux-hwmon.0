Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BE4329E40
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Feb 2026 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770713772; cv=none; b=fl/9y18/u7kao/fcAXHv1h1IQ3zehuAW2rrmX8Nn3E8RSmEl/gKl/28SpaElz8n/Pj2w28/WKk3BhzswZqKfCSjnMhOMokbUkUVUvNwIu1bF06DCuFlELr1kZo4BQTtFjYwYZexMYQrA8P93RfRtXB5KwMQi5XFDLewfDemZxu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770713772; c=relaxed/simple;
	bh=2wf+wdFWM3gZTiC4We4PwsOTJjkV9K9aDEsNNCaPjmg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ErirFlBQli2mqScIcq0ACHbeIs1vIWS2nk/9eo9OeIOVtGmOiM7McpEG2nPs/hGwraC8X3WZiWDOBVQbJiqAmg31bjoRdOsAh1n/+aKaDOyjBWKodPxT3FD3wTxazilxbmJBUfmD6rTvBAHsyyYZCKfsKULePhA0qZSZNR7/qHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eh/V5lVQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+/sWRSxd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eh/V5lVQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+/sWRSxd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eh/V5lVQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+/sWRSxd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eh/V5lVQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+/sWRSxd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9909D3E712;
	Tue, 10 Feb 2026 08:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770713768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4U4rtfd/hapk3NFcT2uSJ36xvb9XcaGnk7F813+pTtc=;
	b=eh/V5lVQCx/ANhoVLFFI87eBEY1X42Mlyf2eEF+fp25tgo4BXMtpU9QItDfkwqINdAgF1l
	dFtyy9btzp2cUc2Q4Cdkz+wwNr1lNFkG30+77oEYu+4Na2gh4a/H8oOGlX8jQ+z5/mEWWO
	oyGA0oMGcONraEU7Fxq9E91EnMy6nuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770713768;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4U4rtfd/hapk3NFcT2uSJ36xvb9XcaGnk7F813+pTtc=;
	b=+/sWRSxdAr/QYnlsTqwazXS/RGayf6HiFYNyUoQ6fLROHxZfv8mStNfgYKzRNPhJICeeoR
	wHFw2EmGDhyKxfAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770713768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4U4rtfd/hapk3NFcT2uSJ36xvb9XcaGnk7F813+pTtc=;
	b=eh/V5lVQCx/ANhoVLFFI87eBEY1X42Mlyf2eEF+fp25tgo4BXMtpU9QItDfkwqINdAgF1l
	dFtyy9btzp2cUc2Q4Cdkz+wwNr1lNFkG30+77oEYu+4Na2gh4a/H8oOGlX8jQ+z5/mEWWO
	oyGA0oMGcONraEU7Fxq9E91EnMy6nuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770713768;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4U4rtfd/hapk3NFcT2uSJ36xvb9XcaGnk7F813+pTtc=;
	b=+/sWRSxdAr/QYnlsTqwazXS/RGayf6HiFYNyUoQ6fLROHxZfv8mStNfgYKzRNPhJICeeoR
	wHFw2EmGDhyKxfAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6213F3EA62;
	Tue, 10 Feb 2026 08:56:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id E0QJFqjyimlkMQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 10 Feb 2026 08:56:08 +0000
Message-ID: <73e8fce4b9d8afe9b9fe387715bfddf168ca9c80.camel@suse.de>
Subject: Re: [PATCH] Revert "hwmon: (ibmpex) fix use-after-free in high/low
 store"
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>, Hardware Monitoring
	 <linux-hwmon@vger.kernel.org>
Cc: Junrui Luo <moonafterrain@outlook.com>
Date: Tue, 10 Feb 2026 09:55:49 +0100
In-Reply-To: <20260207162147.467133-1-linux@roeck-us.net>
References: <20260207162147.467133-1-linux@roeck-us.net>
Autocrypt: addr=jdelvare@suse.de; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[outlook.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Level: 
X-Spam-Flag: NO

Hi Guenter,

On Sat, 2026-02-07 at 08:21 -0800, Guenter Roeck wrote:
> This reverts commit 6946c726c3f4c36f0f049e6f97e88c510b15f65d.
>=20
> Jean Delvare points out that the patch does not completely
> fix the reported problem, that it in fact introduces a
> (new) race condition, and that it may actually not be needed in
> the first place.
>=20
> Various AI reviews agree. Specific and relevant AI feedback:
>=20
> "
> This reordering sets the driver data to NULL before removing the sensor
> attributes in the loop below.
>=20
> ibmpex_show_sensor() retrieves this driver data via dev_get_drvdata() but
> does not check if it is NULL before dereferencing it to access
> data->sensors[].
>=20
> If a userspace process reads a sensor file (like temp1_input) while this
> delete function is running, could it race with the dev_set_drvdata(...,
> NULL) call here and crash in ibmpex_show_sensor()?
>=20
> Would it be safer to keep the original order where device_remove_file() i=
s
> called before clearing the driver data? device_remove_file() should wait
> for any active sysfs callbacks to complete, which might already prevent t=
he
> use-after-free this patch intends to fix.
> "
>=20
> Revert the offending patch. If it can be shown that the originally report=
ed
> alleged race condition does indeed exist, it can always be re-introduced
> with a complete fix.
>=20
> Reported-by: Jean Delvare <jdelvare@suse.de>
> Closes: https://lore.kernel.org/linux-hwmon/20260121095342.73e723cb@endym=
ion/
> Cc: Jean Delvare <jdelvare@suse.de>
> Cc: Junrui Luo <moonafterrain@outlook.com>
> Fixes: 6946c726c3f4 ("hwmon: (ibmpex) fix use-after-free in high/low stor=
e")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> =C2=A0drivers/hwmon/ibmpex.c | 9 ++-------
> =C2=A01 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/hwmon/ibmpex.c b/drivers/hwmon/ibmpex.c
> index 129f3a9e8fe9..228c5f6c6f38 100644
> --- a/drivers/hwmon/ibmpex.c
> +++ b/drivers/hwmon/ibmpex.c
> @@ -277,9 +277,6 @@ static ssize_t ibmpex_high_low_store(struct device *d=
ev,
> =C2=A0{
> =C2=A0	struct ibmpex_bmc_data *data =3D dev_get_drvdata(dev);
> =C2=A0
> -	if (!data)
> -		return -ENODEV;
> -
> =C2=A0	ibmpex_reset_high_low_data(data);
> =C2=A0
> =C2=A0	return count;
> @@ -511,9 +508,6 @@ static void ibmpex_bmc_delete(struct ibmpex_bmc_data =
*data)
> =C2=A0{
> =C2=A0	int i, j;
> =C2=A0
> -	hwmon_device_unregister(data->hwmon_dev);
> -	dev_set_drvdata(data->bmc_device, NULL);
> -
> =C2=A0	device_remove_file(data->bmc_device,
> =C2=A0			=C2=A0=C2=A0 &sensor_dev_attr_reset_high_low.dev_attr);
> =C2=A0	device_remove_file(data->bmc_device, &dev_attr_name.attr);
> @@ -527,7 +521,8 @@ static void ibmpex_bmc_delete(struct ibmpex_bmc_data =
*data)
> =C2=A0		}
> =C2=A0
> =C2=A0	list_del(&data->list);
> -
> +	dev_set_drvdata(data->bmc_device, NULL);
> +	hwmon_device_unregister(data->hwmon_dev);
> =C2=A0	ipmi_destroy_user(data->user);
> =C2=A0	kfree(data->sensors);
> =C2=A0	kfree(data);

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
--=20
Jean Delvare
SUSE L3 Support
