Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4791C10F03
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 15:18:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7528520685
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 15:18:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7rUXgb1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbfDWPSO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 11:18:14 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44556 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727877AbfDWPSN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 11:18:13 -0400
Received: by mail-pf1-f196.google.com with SMTP id y13so7646129pfm.11
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w5KMSP7GiMhaXxTZPLuqWtMjEi25m4CgVdcbyTxd/OI=;
        b=a7rUXgb1kp5r41jILMs7ObaMjXNuaNQhQtPGAwhASG90LAmK+Qux+JOYHrJ3t9jX9b
         Ru9ksJCzOlIay0P6UhK9Q66eJihdZMoP1kWTK3RDq07rMXbCZXYqfzYb+7mNNBVuxSRT
         EpTAM5G9VRajO5hQTKnm5Tla0PSAg8WU98ZIzqoVA22o5vmVy1sPTDUcURBGsnYlzrLu
         U/pyr2r2VsvL/9XezPukR37m7TJl1E7MgFVNbps/zqqZRrc1vpYyCwIRW+8HTAcS3yO7
         VylmMsJxb1PYeqMYJLClsYpS5U5g+2waKFmj+XXFZ9ZQfGoXroVTDJnJSgmbAj5n9YfZ
         BOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=w5KMSP7GiMhaXxTZPLuqWtMjEi25m4CgVdcbyTxd/OI=;
        b=ce1dNwt08CdqHB82JM7bs/+n68KaLbIgeRwGpX/Sos8oG1EeDseVMI/ZrrY3KmAAaQ
         DrJk/m31HDMT6LMvIMgtYrYgRNmOcMweRPumC/09wgusx95i/piE4tJtJdl3pb0PCLZK
         Pr3iuUIylfxV/Qg+mM47KbZQhK6ohqKsZw+N4kaPy2dnmmUb3AnEjT9gz9r0264OPLpK
         v42p6cb5Z+rpkSFP1YANVpCxlK8RDy9dObOwfGmOYPvinKnmE0vM1fi4C0OdyL7wn2De
         2aCYJwp9O7eVXYSuD3iqAoc+Y8Z3IGfUU8nUDPiWII1GE7SmqB28cFjB/z7kLchGSH90
         U5Jw==
X-Gm-Message-State: APjAAAVP31H5nJHwHDSNfdiIOMCaw0QMbnTQJTx8U/5f3g7hqr9GRp85
        abRDYg5FJY48HtWzs/5jrrM=
X-Google-Smtp-Source: APXvYqwEZdDW8oFVpUFNaFQKh4ZShir5G5Wa0lXdbwKwjtH0CpeF7v6/hUvANzXBAmD7iXU0bbSzIw==
X-Received: by 2002:a62:b411:: with SMTP id h17mr27143370pfn.61.1556032693297;
        Tue, 23 Apr 2019 08:18:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c17sm21455342pfd.76.2019.04.23.08.18.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 08:18:11 -0700 (PDT)
Date:   Tue, 23 Apr 2019 08:18:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 11/11] hwmon: (max6650) Fix minor formatting issues
Message-ID: <20190423151810.GA29768@roeck-us.net>
References: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
 <1556026391-15360-11-git-send-email-linux@roeck-us.net>
 <2E24A867-B97D-4379-AFD5-531DD58C9EA3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2E24A867-B97D-4379-AFD5-531DD58C9EA3@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 23, 2019 at 10:38:58AM -0400, Jean-Francois Dagenais wrote:
> Wow, you sure had fun over the weekend! ;)
> 
> max6650 looked like it needed some love, nice work.
> 
> I am keen to try it out. We are in the integration stage of our board so it's a
> good time to adopt such changes. The value of our testing would be limited
> though, since we don't use the tach line at all.
> 
> I am not properly setup in my workflow to easily work with patches in emails. I
> could manage, but it might be easier for me if you had this work in a branch on
> github/gitlab somewhere... Any chance?
> 
I pushed the series to
git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git,
branch hwmon-playground. Let me know if it works for you.

Just in case you are interested, I tested the changes with
github.com:groeck/module-tests.git. The test script is in
scripts/max6650.sh.

> (BTW, are you guys fussed over 80 columns emails here?)
> 

Yes ... I usually don't say anything unless it gets too annoying, though.

Guenter
