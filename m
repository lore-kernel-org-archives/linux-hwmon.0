Return-Path: <SRS0=izF8=ZN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACC3C432C0
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Nov 2019 13:48:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3672A2071B
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Nov 2019 13:48:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6kBPygH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKUNsf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Nov 2019 08:48:35 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:32930 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfKUNse (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Nov 2019 08:48:34 -0500
Received: by mail-lj1-f196.google.com with SMTP id t5so3334542ljk.0
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Nov 2019 05:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pELjRh/9lf7cSb2H7LPcD8lsqZa9gpNha5+OJjyl5g4=;
        b=f6kBPygHYzvNsRAMWpmcl1aixibT3WjV8ewyKkXI8IwpKYwTEkC7dJjiU0aBn+FTn4
         nL8mnw5dymhCiWUiYrf+35+y0STQqw/o2iNHFuUkOViXj0GubHd3hKgdVJBO1qBUp4ih
         az/G7w+1b8hnWwnGl6q4Leh0N/mBqMWyFr/iohM0yittXPTEmKdah3K1pbMauEMLDiHf
         e5A/pv4WbL7WTiw5+cPO+yzoAGGsPcEkwOfjdWO1rweS5FBsxr104256O5sLIPnv52y3
         EKBytfcV+oeE3m+xI2QIQBiNO7uYHCnXtusaaSSqedbU7/TmPUw0d0BYstue/EuUJChz
         S1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pELjRh/9lf7cSb2H7LPcD8lsqZa9gpNha5+OJjyl5g4=;
        b=NW4oxzyLbVMpprphWG734tBG+60ayLFMZgX/1vH64tjFlj2kI+wyb/7+fMWs3HzxG3
         VtL0WPccJnGqzBj0/S8k63T6JmeSzKrGdV/xq3275Ry1icVIDZghGReUA2w9j+r1ymXb
         gzncWZ/BwW62bUFO6vCBM3qj2/DT/cQt/9czhtLefrgKr11esiSihs3x0VVJ4qtvtUu/
         EbdsA/XZ717H0QCRzsst7PI24Fy4JUN4BIbzzdr0odCx1sCDPc7vdoN1fmEdosFAQy3I
         La6i8fYVnw9YXzo4AjpZQbVEEnmtp5YnnbvlLSXR6joU2ZQyh2x2OzzQ73qSEvzQMouH
         6qMQ==
X-Gm-Message-State: APjAAAWDA1n1gUmKThjS1gkkOTzVLoa+N23DLcWP7IP3Q5TjKKtKWlkS
        usENfGYc9ij2dV5ytotGolQ5IvS0jni2j2g9Er8=
X-Google-Smtp-Source: APXvYqyQS8UeZg8nndelWFtmtH4vVyX9P1sGmFVsPIYM5oYDv8i8LnOFsqMLXKiRiLzbSvkvvfKY5EY1uTY2+8y+F+o=
X-Received: by 2002:a2e:864f:: with SMTP id i15mr7383454ljj.29.1574344113019;
 Thu, 21 Nov 2019 05:48:33 -0800 (PST)
MIME-Version: 1.0
References: <1573746001-20979-1-git-send-email-akinobu.mita@gmail.com>
 <1573746001-20979-2-git-send-email-akinobu.mita@gmail.com> <20191120184827.GA12322@lst.de>
In-Reply-To: <20191120184827.GA12322@lst.de>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Thu, 21 Nov 2019 22:48:21 +0900
Message-ID: <CAC5umyh8kbQTPh22CX6uEcR1jNEHxa+5HCjGDahnZ_i1k=cEPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] nvme: hwmon: provide temperature min and max
 values for each sensor
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

2019=E5=B9=B411=E6=9C=8821=E6=97=A5(=E6=9C=A8) 3:48 Christoph Hellwig <hch@=
lst.de>:
>
> On Fri, Nov 15, 2019 at 12:40:00AM +0900, Akinobu Mita wrote:
> > +/* These macros should be moved to linux/temperature.h */
> > +#define MILLICELSIUS_TO_KELVIN(t) DIV_ROUND_CLOSEST((t) + 273150, 1000=
)
> > +#define KELVIN_TO_MILLICELSIUS(t) ((t) * 1000L - 273150)
>
> Didn't we want to move this to a generic header?

Yes.  I start preparing for <linux/temperature.h>.
Once the change is accepted, I'll move the macros to the header.
