Return-Path: <SRS0=YRkG=ZF=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E072C43331
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Nov 2019 12:58:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33BC7222C6
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Nov 2019 12:58:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njckh+1M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfKMM6O (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Nov 2019 07:58:14 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39332 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbfKMM6O (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Nov 2019 07:58:14 -0500
Received: by mail-lj1-f193.google.com with SMTP id p18so2460229ljc.6
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Nov 2019 04:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vgua7CPQ6DoU2gQQx1394j69/MTl73YCclHJSYqCl8I=;
        b=njckh+1MCFk3rOXgmP5NdQfWiJzezGiupKYm71jbFio6pZwHj8ysvNsDsDJ0kiboQT
         0BVn5P0sbtNTft55l/MuEqrzwMKTWI7J/gr6UvKl16mWG46Sy6KuQLCbpDaROg2VBzbu
         hVPEh2K7QsuexRRj2etiDD+ZMVpm9UyQZgPsZCoOgcwB1rRcNxueyPSutlRgpJ9NT7rt
         Z0LtnDoxLEEf7ItyXvUdumJuBqyMojnt3zAG3AxEIEXu9oy89IdMZK5nUKbmgNi/1dHk
         hsludrY9wYflZALdSUBggw6Bb4jTiDpEuB7ESEhcaRA+Ftl5Rs4nc9D5Wd4AXLYnG43r
         /L3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vgua7CPQ6DoU2gQQx1394j69/MTl73YCclHJSYqCl8I=;
        b=saVlsbxeMexp4luNL0GlgJDBgpeXfdPaA8/6XCn/eRXkHywTsmlmOJcaLdaExdOXdD
         KgGiaqxQZleZMuGl1qmkheW7w0yo8gwhLFi2MvHywliNr37Qnk4A12qiXp+KqU3/xAoM
         3CPK4c6MNxZanDPe4XQPAL9TV31Zkqv9De/2pQf/to4Ox4YFWejLMvTEt+KBFgDpZJML
         1E2q8n/fGGcd9Ng3jKPLer/SkYhXwncvVFuBNWg3RGup2KG2XQowWcv5n2oWMX6NIN+i
         Me4bxxb9k/movUydZY4e5NRuNJbv+INFROJUE1Vl8KYoy/oFR1zRqhXIDmYnl6kzUobS
         ip6A==
X-Gm-Message-State: APjAAAUeO9LR90B6Tlym3UxNWp+SN9OBHx19EVMRs8vbFDSjFkHyGZsv
        3MBE/ZwdMbsQMYirxYmY7kNMLm6VxfaFsJma4/E=
X-Google-Smtp-Source: APXvYqzAKmoOlCuWhzIgX5ba3Kgl1IodyrNmydw0zoSAfXRTAjjTnbh0qkR2Jjl+VIRCNKMA0dR3zQj5sySwwQJBavc=
X-Received: by 2002:a2e:9083:: with SMTP id l3mr2609468ljg.127.1573649892396;
 Wed, 13 Nov 2019 04:58:12 -0800 (PST)
MIME-Version: 1.0
References: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com>
 <20191111165306.GA19814@lst.de> <CAC5umyi97UJZzk+4soD+th0BZ71WfnOqnTWWuTYKyo6aWTdLXA@mail.gmail.com>
 <20191112142127.GA11580@lst.de> <CAC5umygX=uBQsWV8O=9NL3HeVNo_iMcq7BE-vA-wpQtyU5iV3Q@mail.gmail.com>
 <20191112163807.GB26911@roeck-us.net>
In-Reply-To: <20191112163807.GB26911@roeck-us.net>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Wed, 13 Nov 2019 21:58:01 +0900
Message-ID: <CAC5umyjVFRK+CfO=4FpzKUGyAaRVigj9NBoSazA6RV8AvhTbCw@mail.gmail.com>
Subject: Re: [PATCH] nvme: hwmon: provide temperature min and max values for
 each sensor
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Christoph Hellwig <hch@lst.de>, linux-nvme@lists.infradead.org,
        linux-hwmon@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
        Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

2019=E5=B9=B411=E6=9C=8813=E6=97=A5(=E6=B0=B4) 1:38 Guenter Roeck <linux@ro=
eck-us.net>:
>
> On Wed, Nov 13, 2019 at 12:00:22AM +0900, Akinobu Mita wrote:
> > 2019=E5=B9=B411=E6=9C=8812=E6=97=A5(=E7=81=AB) 23:21 Christoph Hellwig =
<hch@lst.de>:
> > >
> > > On Tue, Nov 12, 2019 at 11:19:46PM +0900, Akinobu Mita wrote:
> > > > OK. I'll add two macros.
> > > >
> > > > #define MILLICELSIUS_TO_KELVIN(t) ((t) / 1000 + 273)
>
> DIV_ROUND_CLOSEST() ?

How about these definitions?

#define MILLICELSIUS_TO_KELVIN(t) DIV_ROUND_CLOSEST((t) + 273150, 1000)
#define KELVIN_TO_MILLICELSIUS(t) ((t) * 1000L - 273150)
