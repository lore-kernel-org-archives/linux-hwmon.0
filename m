Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6746C77B75
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 May 2023 04:58:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjEEE6L (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 5 May 2023 00:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjEEE6L (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 5 May 2023 00:58:11 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E16A243;
        Thu,  4 May 2023 21:58:10 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-52c759b7d45so1104375a12.3;
        Thu, 04 May 2023 21:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683262690; x=1685854690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OzSdDfhBu6bM4Kn30esE8MtemEERFMfw7x5S/4OC1sw=;
        b=NmheHr+Z1mwGDvHYu4u1v77FlJfg0c1889VcrZpmimKxEzIeZwnGCcohEBsBEY899b
         2JMiaMqS/HSexEkDhxnvl3BGfoUWYddUGK6qiZ4rNIecGjsmNRd2r7iiqxKN+pfrTrWQ
         dzYOlHVhC3MjsgXGwqiX1DJFXZyTSSbTiVVsV5yUH4aFNkH1BnTOqlyYFjVNPq+RLWDb
         t6bJHdN9c1+JPy3v8zh6+2h+XCM8uB4y358qXrXP6vgJ6b68vK0w3hHks8bSpbhGi1zT
         8ZoPO6bc2cD9tOYir5YzMZ/cEekXk1VoPjA1kgo9IR1DZeF9ZOj9Uig/PCuxeKfKQo1g
         HrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683262690; x=1685854690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzSdDfhBu6bM4Kn30esE8MtemEERFMfw7x5S/4OC1sw=;
        b=UFfuO1ErZO0gq1ojrxKoR/qSFwvsL8HJR79TEbGs95SSUjwb5ii/yliybqxUwg2zTz
         nHCLVc9SdkbFinl9q612tTcsYrpXlL0QmZKM4lQwqxD1+weyFZJf5WEdGHg/bp9Qldes
         kaiVw6tpJaLXC0LTKJtinHqBYrxJfCQtGiNQ03prOLzYC4OEh1pd3STubl6i/7XowsHI
         BvxJrkQEb5fR7jH1gZfZhylsluBR+PHWuqhUxdHXmGbTzPjnlmNiyWECCq8RyqFdi7PL
         gCHNMKh0XIHvTt3pLiDsKbLymTIcxJOHZ0H96yx4cdKTcOK8Lhs+PYoefM83VyY0Iz/F
         rmqQ==
X-Gm-Message-State: AC+VfDyKcBG9SKo5LSstE1FzB6CdQMR/awtc7YYA6HuqKIDwdxcSgoUO
        ZUMecFIfDrMhSkSQKPeHLUM=
X-Google-Smtp-Source: ACHHUZ5H88IkGNh3Gu8DErn2VUMjYaTQeqHheVJPulViN2lgF+XyXcX62POjrzVhIegqOJUiaZUxdQ==
X-Received: by 2002:a17:902:ab91:b0:1a6:9906:1eb7 with SMTP id f17-20020a170902ab9100b001a699061eb7mr163551plr.35.1683262689640;
        Thu, 04 May 2023 21:58:09 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-25.three.co.id. [180.214.233.25])
        by smtp.gmail.com with ESMTPSA id jw21-20020a170903279500b001aaecc15d66sm547655plb.289.2023.05.04.21.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 21:58:09 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id ACC011068DB; Fri,  5 May 2023 11:58:06 +0700 (WIB)
Date:   Fri, 5 May 2023 11:58:06 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     James Seo <james@equiv.tech>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC 01/11] Documentation/hwmon: Move misplaced entry in hwmon
 docs index
Message-ID: <ZFSM3txfu5Aqv52E@debian.me>
References: <20230504075752.1320967-1-james@equiv.tech>
 <20230504075752.1320967-2-james@equiv.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iIATXFk7rJgLSivV"
Content-Disposition: inline
In-Reply-To: <20230504075752.1320967-2-james@equiv.tech>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--iIATXFk7rJgLSivV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 12:57:42AM -0700, James Seo wrote:
> Move the entry for the inspur-ipsps1 driver so that it no
> longer appears in the hwmon docs TOC as a document relating
> to the hwmon subsystem itself.

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--iIATXFk7rJgLSivV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZFSM3gAKCRD2uYlJVVFO
o5XkAQC8ROGTO44qE5aHeQZw4rH9/6ROsEZ3Ri5uyzXUUr+DMAEA8yvh10mEBEc6
ct2CvF+064jM9BFSdGu9We3yM8ozKQA=
=A+NR
-----END PGP SIGNATURE-----

--iIATXFk7rJgLSivV--
