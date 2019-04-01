Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B585C43381
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC3742133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="syiFcvyL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbfDAQTo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:19:44 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37611 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726854AbfDAQTo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:19:44 -0400
Received: by mail-pf1-f194.google.com with SMTP id 8so4826028pfr.4
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=TBo0s7Zb+N+5egvhOSn72Gn9/0PfBKpyjuwdQyz3Ctw=;
        b=syiFcvyLcVlK5niVgOsYs+7aMBEh5U++PZ5buhcf1s3nR2mxgVmSa5YVDK6Vkep727
         GPTkh/PmG8Ol5H7IcjAjIjF7rndkPRlLV/QiQZ9UvdW/lLoLZyI2f9mmnnD/t1gCqKMQ
         4yzW9ceN2VkWoUW/l7eJJ9Ilo9gHniKdXoV5Dq3ZXIMGhX6UuL8iBNmWWictCgqe21Na
         lh7u+2nzt9Z5KbgBY0Jdf4aYAS6XoEPypVqBkepiaIk22ic8QS2HpNsnbJDuKGBpd7pj
         3f9HGcYgY5ys1udR5ga2r2eiuzduMoJOhq7xYOxQ8LxWobTa4MpyGGVLXcWPNap4hS6C
         0iNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=TBo0s7Zb+N+5egvhOSn72Gn9/0PfBKpyjuwdQyz3Ctw=;
        b=WUa3movtwSfoma4toHXuVncSQKS+n3djLovnU+oLCqAg6S/6My8tD0BDc4qbL/nmlA
         CEB/1aC570ZzytYjtXUZ+HuVLl0VYrrrYm4nBLLhPN4ls95Vziug52rlC8un0lPAQLfU
         B0mI/dZpdZQxbsSj+RvTvCh4UKE+twkF0c7FdppjQUPIatLq4XAUjsi/FEwlfYi18KAj
         8/xvefS2R0NhdpiFOiV31dvHJIGX+/G6vPXoyD1EKs2ViNeRTQru57BgGlfkAZz806lh
         Ta2Oiqf6W8O1XdBUJWCxJFCEPu14U7AfH/fk1y539/wMP+7H/EeAutzidCuxwhDQbFIl
         AzTQ==
X-Gm-Message-State: APjAAAUelr3vlvKov3ZkjYs6LfrR7riqc5uuKMgcH2en3apNJ4rk+ewG
        GgYCC66bpxgsRn0dLFZQuTHKxnqW
X-Google-Smtp-Source: APXvYqxt3qBzbC8BmhqkI9ulTSLYWpoGbXDG6D82R0yVMTLUordXVAsaKzWZM87P5Sxuh0PgWvJiEw==
X-Received: by 2002:a65:5003:: with SMTP id f3mr49360919pgo.29.1554135583187;
        Mon, 01 Apr 2019 09:19:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s12sm15876324pgc.28.2019.04.01.09.19.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:19:42 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 00/17] hwmon: Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:20 -0700
Message-Id: <1554135577-11889-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The HWMON_CHANNEL_INFO macro simplifies the code, reduces the likelihood
of errors, and makes the code easier to read. This series converts all
hwmon drivers to use the macro if possible.

The conversion is done automatically with coccinelle. The semantic patch
used to make this change is as follows.

@r@
initializer list elements;
identifier i;
@@

-u32 i[] = {
-  elements,
-  0
-};

@s@
identifier r.i,j,ty;
@@

-struct hwmon_channel_info j = {
-       .type = ty,
-       .config = i,
-};

@script:ocaml t@
ty << s.ty;
elements << r.elements;
shorter;
elems;
@@

shorter :=
   make_ident (List.hd(List.rev (Str.split (Str.regexp "_") ty)));
elems :=
   make_ident
    (String.concat ","
     (List.map (fun x -> Printf.sprintf "\n\t\t\t   %s" x)
       (Str.split (Str.regexp " , ") elements)))

@@
identifier s.j,t.shorter;
identifier t.elems;
@@

- &j
+ HWMON_CHANNEL_INFO(shorter,elems)

The conversion does not introduce functional changes.

Many thanks to Julia Lawall for providing the semantic patch.
