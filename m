Return-Path: <SRS0=ZG3s=PP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FB8C43387
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Jan 2019 23:16:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D1372147C
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Jan 2019 23:16:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJfOkV1U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfAGXQ0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Jan 2019 18:16:26 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44171 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbfAGXQ0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Jan 2019 18:16:26 -0500
Received: by mail-pg1-f195.google.com with SMTP id t13so803827pgr.11;
        Mon, 07 Jan 2019 15:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N9PbDp56khfduIisJaQH8KxthChNRoIn9eCKeskdDuI=;
        b=EJfOkV1UaupSI5eKQh9waERp3l3x2Qztn/VCByZwvWfXICTdSDusIPR/r6ICMgxIGH
         BGkt5QJ7oHuAYgv5cYfQhcjBmyK5iX55eolHAdF7zxpLnH33DRT9fcXcm+y21ZzVsdN5
         3nNPAN8t1JD1+PlvvZYyPADVLjWnGKyLmOUL3YDe7t69lID/LDBA8TsCiK7RlB9MO33C
         i1yjm+5b4bBE6AES3DHAilUmCriLNn1IYYo91o1dgZooK2N0wU+GE2Y+rweQV3Wsdy2E
         Q4jm88gpg2A9RhVdXfaRN6vNPQ+6tnPbRlCzFxmZTNPggMRIfKFo2u+UL3JKX6urPEkP
         tzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=N9PbDp56khfduIisJaQH8KxthChNRoIn9eCKeskdDuI=;
        b=Gl1oKoj387ELJOAwRyyFkTy0wUyXAfZGP3Ed3Kht7clPN9xhM0zhnJQtFN8SjJ560C
         f+qDzPg3SfdZn7ZwtMiGoqGWThLBZIILbrhT9I8iMkYAtM2k0ZjL7dkgW6beewOECxzY
         UAtsYvrcVbWknKWhD8Jqbx2nUZVmwd8bOedV8d+OBavfEYwObLeb/RXPr3TYHHsi2C02
         63QIO8rucEtU/himBZAnXf7KXpbzl16SE79uPan8SzL3SZyvnpBlFQ4Q5JwoXvMvx6ct
         Qic6s7m/oHB1Xht1e+X8iWYiIAZRCNTyQUj8Hop+Z+Wg1n7PR8yXKqZh5WbOGlE5YYDv
         5fSg==
X-Gm-Message-State: AJcUukeNH9XrfiatDCVAB6zEi6WY6bReuu8CEyTFk+aS7GxcusDc7olD
        P3xI6VyD1PnpK7L3WxbqW69qiqbv
X-Google-Smtp-Source: ALg8bN41u1zDpRIr66CAH6BrBaYS31O7gAtSdj7Q9WK/Eo2/4DpEX3PkEfesPVnEpKWbt3QBkzNv2w==
X-Received: by 2002:a63:981:: with SMTP id 123mr12609950pgj.444.1546902985418;
        Mon, 07 Jan 2019 15:16:25 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h128sm101402654pgc.15.2019.01.07.15.16.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jan 2019 15:16:24 -0800 (PST)
Date:   Mon, 7 Jan 2019 15:16:22 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Chengguang Xu <cgxu519@gmx.com>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: fix typo in Documentation/hwmon/f71882fg
Message-ID: <20190107231622.GA2126@roeck-us.net>
References: <20190104142722.24824-1-cgxu519@gmx.com>
 <20190107154049.4e10e0c5@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190107154049.4e10e0c5@lwn.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 07, 2019 at 03:40:49PM -0700, Jonathan Corbet wrote:
> On Fri,  4 Jan 2019 22:27:22 +0800
> Chengguang Xu <cgxu519@gmx.com> wrote:
> 
> > Just fix a typo in Documentation/hwmon/f71882fg.
> > 
> > Signed-off-by: Chengguang Xu <cgxu519@gmx.com>
> > ---
> 
> Applied, thanks.  
> 
Ok, I'll drop the patch from hwmon.

Guenter
