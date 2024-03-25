Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB4C1C635B
	for <linux-hwmon@vger.kernel.org>; Mon, 25 Mar 2024 04:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711342763; cv=none; b=A4dETI594xlVUvHtIDDq4P0jgnD3Pd/r1Z3we4mjrTa6IeFXnqaVUklGVXz9nVR13+4EZIc+Z8ztAl9KhiLXP35sPqLHrpdfJSA/2WdTSTn9LI9e2hryX3oDq8XHvbZT55RnlnU3j9Gv4VW25kQhIrbyVKnc4znm663spLdyLRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711342763; c=relaxed/simple;
	bh=fH8B2JHmzKLUC1TNtTmp/iTbRcWg5X2GQnMAmpc5WXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b872c+q+sv5fzWz2e7SMtA8k6v0cv/dLvOpfxXx8V25d+PCJ3xskAAFqPnvJm71FV9IJR1veYDldhGkL6cBLRFdDBq4JAiTNoegCrMPP60ZTNeMaii3Tf/eIX/Oa0tLM7OO072PBU3YlUYhAhBs2bl4N8mG9imgOlKAb8v0xQu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FQ4INuVM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FQ4INuVM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711342759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fH8B2JHmzKLUC1TNtTmp/iTbRcWg5X2GQnMAmpc5WXI=;
	b=FQ4INuVMcZaEQLugSjiGawkRkY6m2t2TxjAC1kSDJM05SCafxb/OdOodyh62bnzA5o70ER
	3tAeXO+nul/LKj68MfE0BesI9F+So127nBybQ/0Adl5JiFYUTWxdIPyrBBtw7DDG/6OXBB
	gcCfXBnTxdEEAzvx1+tAon0V1Pe8HtY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-XHPdo7yqNCONmpFedmaPEw-1; Mon, 25 Mar 2024 00:59:16 -0400
X-MC-Unique: XHPdo7yqNCONmpFedmaPEw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F174A85A58C;
	Mon, 25 Mar 2024 04:59:15 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.64.240.7])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A80F51074E;
	Mon, 25 Mar 2024 04:59:14 +0000 (UTC)
From: Seiji Nishikawa <snishika@redhat.com>
To: pali@kernel.org
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	snishika@redhat.com
Subject: 'Re: [PATCH] hwmon: (dell-smm) Also add Dell Precision 7540 to fan control whitelist'
Date: Mon, 25 Mar 2024 13:59:12 +0900
Message-Id: <20240325045913.385853-1-snishika@redhat.com>
In-Reply-To: <3f0d7398-401e-4e7d-9f48-0a6bc0034c28@roeck-us.net>
References: <3f0d7398-401e-4e7d-9f48-0a6bc0034c28@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

On Tue, Jan 9, 2024 at 12:34 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Sat, Dec 23, 2023 at 04:36:58PM +0900, Seiji Nishikawa wrote:
> > This patch, in addition to 95d88d054ad9 that added Dell Precision 7510 to fan
> > control whitelist, also adds Precision 7540 to the whitelist, which allows manual
>
> Use imperative mood to describe your patch.

Just as you pointed out.

> > PWM control on Dell Precision 7540. It has been confirmed that the same SMM
> > commands work to enable/disable manual PWM control on Dell Precision 7540.
> > Acked-by: Pali Rohár <pali@kernel.org>
> > ---
> >  drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> > index 44aaf9b9191d..f946257f72c6 100644
> > --- a/drivers/hwmon/dell-smm-hwmon.c
> > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > @@ -1330,6 +1330,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
> >               },
> >               .driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
> >       },
> > +        {
> > +                .ident = "Dell Precision 7540",
> > +                .matches = {
> > +                        DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +                        DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Precision 7540"),
> > +                },
> > +                .driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
> > +        },
> >       {
> >               .ident = "Dell XPS 13 7390",
> >               .matches = {
>
> Patch uses spaces instead of tabs and produces lots of checkpatch warnings
> and errors. Also, Signed-off: tag is missing.

Apologies for the noises and the missing tag.

> Overall, please read and follow Documentation/process/submitting-patches.rst.

I should have done that.

