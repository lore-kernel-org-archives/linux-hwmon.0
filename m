Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C41C25B48
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Oct 2023 05:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjJZFYc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Oct 2023 01:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjJZFYc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Oct 2023 01:24:32 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50864DC
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Oct 2023 22:24:30 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9b9faf05f51so67966966b.2
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Oct 2023 22:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698297869; x=1698902669; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gQVOP3Ozc4kadljL/3ePCYJrDXuOIwOB1JwuY5YXlXM=;
        b=kmc0aTaaD3iX4kptUtMqZH2xA7Lw3d1hFEEfDGU3p8eay/VeDD84T55lcCtfRlIUWa
         4aVjXHLH1M/DOU50IiTXxxHq/jd4zl446qKLb6hQUkGpRZd7d7GQ00xNjO0AV0wx1vlw
         3e85k+6Bkw0b4O72hyPfDP7WdVJ8YozSFVuHV37e0QtjVFJ88MqfLJ1h2C3y7LPqqku7
         e7GxZl6dmgC4athyAdr3xgA2hdxIQPXoDRVwP5JaZ98By8nJ2aDnOB7cZvcnX6+TpM/6
         mT332RO1eUVW2IFdxjEky4cf6/plDW3IdCZBkKZ0ne2m1646RwjuNXNFp0Y+J90yTX6m
         Ya5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698297869; x=1698902669;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQVOP3Ozc4kadljL/3ePCYJrDXuOIwOB1JwuY5YXlXM=;
        b=Jpg/xONDLtpo34vTWIMh+cT7rQwWhk9uCjOS2tinfGf3zPYP/lsvzxeHERckHQrerD
         uPdP0DSI+uoldKfP/MU5gcXsAqSLfW6F1D5F652ct/zhLkefJ/wgwY30xzAJm6ZLKhL8
         OYbiXCbTsEaggOEK/e9Su29E2ou7P/Drqo5O8EZRo0hnfJDauCy4WjA3b7blkUHNf4x4
         EDCf4dQgsg15+B7NQ7fX8B1UfSMn6Tbzkq8BaraTdztZC6bB1SK128OqHTyoUz/7xc+Q
         PB6HOFbaCljOPwdM5FUFLauCBpxCqyQa9V5VnvejAfeuoYqjED1I7fHjV7VOQQ9YTX1D
         3vGw==
X-Gm-Message-State: AOJu0Yx+apOlkFZ108Ou98z844Jh/Z4OquwD19a7kpYiYgNhE59d1j2o
        2X9rGuzKyvXx98DkwR+GqJU=
X-Google-Smtp-Source: AGHT+IEn7bQFolUUwuvvFEZjRFBXGMQcO367IhDlNmuZGWzgjhACre0w3c/4oqYzk19bNTAvzPxuXw==
X-Received: by 2002:a17:907:80e:b0:9b2:aa2f:ab69 with SMTP id wv14-20020a170907080e00b009b2aa2fab69mr13531181ejb.30.1698297868379;
        Wed, 25 Oct 2023 22:24:28 -0700 (PDT)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id l17-20020a17090612d100b0099cd1c0cb21sm10838372ejb.129.2023.10.25.22.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:24:27 -0700 (PDT)
Message-ID: <76a49e935fa745242b9e8aa4746c9a1bd5525aa8.camel@gmail.com>
Subject: Re: [PATCH] hwmon: (axi-fan-control) Fix possible NULL pointer
 dereference
From:   Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>, Nuno Sa <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org,
        Dragos Bogdan <dragos.bogdan@analog.com>,
        Jean Delvare <jdelvare@suse.com>
Date:   Thu, 26 Oct 2023 07:24:26 +0200
In-Reply-To: <1623e497-d850-47bc-925b-f97439864299@roeck-us.net>
References: <20231025132100.649499-1-nuno.sa@analog.com>
         <1623e497-d850-47bc-925b-f97439864299@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 2023-10-25 at 11:57 -0700, Guenter Roeck wrote:
> On Wed, Oct 25, 2023 at 03:21:00PM +0200, Nuno Sa wrote:
> > From: Dragos Bogdan <dragos.bogdan@analog.com>
> >=20
> > axi_fan_control_irq_handler(), dependent on the private
> > axi_fan_control_data structure, might be called before the hwmon
> > device is registered. That will cause an "Unable to handle kernel
> > NULL pointer dereference" error.
> >=20
>=20
> Applied, but, please,
>=20
> > Fixes: 8412b41 ("hwmon: Support ADI Fan Control IP")
>=20
> WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<ti=
tle
> line>")' - ie: 'Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")=
'
> #88:
> Fixes: 8412b41 ("hwmon: Support ADI Fan Control IP")
>=20
> consider running checkpatch on your patches in the future.
>=20

Oh, sorry for that. As you figured I just cherry-picked the patch from a co=
lleague. I
think it's time to have some kind of hook running some basic checks before =
git send-
mail.

- Nuno S=C3=A1

