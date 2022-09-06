Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F401C38145
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Sep 2022 20:15:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbiIFUPe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Sep 2022 16:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiIFUPF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Sep 2022 16:15:05 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C654189812
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Sep 2022 13:10:40 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id o4so12434630pjp.4
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Sep 2022 13:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=9Td8XpGUYGMQ1ztn2ab03NOmJkL81G2Vr9SzpEsLe8c=;
        b=Syh6qYGXPF1+iXWMWdTe//lloZ4aytk7hRROJjaD0T7IZ4sxQ5FZzvkfGiHDmiqsmp
         8dyvavm7cDYn5aKHfkjaor7tejxYcj6EPQbZtfapaXst82kJNcNuA7nAIZfJNTE8nOnm
         nTOcZAcyNegEUGO7Hvryv1vknaRJj49EZG9v/K/dz4S/UVpyWh32dVtKkh2dYGxIrdh3
         LDjglxk5Z1s/x5kg2MRo5Cjm+WrFVrc6rcKUloCvgnfA37wbbITpCcEpKDsuvxV73tlQ
         Yk3XwS9RH3NrZDQShKEw3ilvNGv3JlPn+7fXcJW/k9VH3sTvTdeXUHv0HV7JJH7AbSjf
         qiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9Td8XpGUYGMQ1ztn2ab03NOmJkL81G2Vr9SzpEsLe8c=;
        b=N5GE/E7DoCwWEMdsDnlEke+G4YVPTHfRacR9LgAhuQJVfKoqB6KSw4JrCHm63nyy4t
         VOVDGE6tSKWCJeGSAYMB0PTEBDW6/Zz4HszcImJYBBEUiv3u7LMisNhfegZCLlokORma
         PWuDCxBRliTxiMh8ACgppyMVgHrbPSC34hWzDpBBE82ugP/sHJjmfg9Lkc6kmb2h3C/l
         IveDbjbHNEPAiS4PugPcZQmiWLa5Xg4aWOhobGRRs3NJXUoVh/XaFZ6Q32fPAQm+Dj20
         9cczVV2Y1WTOz3xHFbFh+lrwTRzWaBXi9WpIfe2BePJ+qYf8x9yWvOnM5BcNRs2EOwgo
         FN/w==
X-Gm-Message-State: ACgBeo087/JW9Kr7EeU9JNfBTauYrfgYIJ/0KIgOh6BSjWhXBcMNFAPx
        5wTwVfazOoqk0zUm4nwPIw0=
X-Google-Smtp-Source: AA6agR6SCB0hkPZtWwhbWCeEXIrP2/VUlmccYhvDsSbxMoIhQI21C5+BOIe+0ZFFwTXNOCwfQPzZJA==
X-Received: by 2002:a17:90b:3b4d:b0:1fe:4d47:76ed with SMTP id ot13-20020a17090b3b4d00b001fe4d4776edmr27222457pjb.150.1662495038393;
        Tue, 06 Sep 2022 13:10:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001714c36a6e7sm4144764pli.284.2022.09.06.13.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 13:10:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 6 Sep 2022 13:10:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christopher Klooz <py0xc3@my.mail.de>
Cc:     eugene.shalygin@gmail.com, linux-hwmon@vger.kernel.org,
        regressions@lists.linux.dev
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other
 distributions
Message-ID: <20220906201035.GA3453623@roeck-us.net>
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Sep 03, 2022 at 01:00:33PM +0200, Christopher Klooz wrote:
> Hi Eugene,
> 
> Currently, we have user reports of at least 4 Fedora installations that have
> issues with asus_ec_sensors since 5.19.4. They remain in 5.19.6.
> 
> All issues can be solved by blacklisting asus_ec_sensors.
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2121844
> 
> The bugzilla report contains kernel logs of two machines, one with
> nvidia-driver and one without a tainted kernel.
> 
> The report and the contained ask.fedora link contain some elaborations of
> how the issue manifests at the users' machines. The major issue is a wrong
> output of battery power percentage (in one case it gets stuck, in the other
> cases is becomes erratic). Also, in one case it has effects on suspending
> (see the report).
> 
> On the Internet, there are already reports from other Linux distributions
> noting the issue and the same solution (blacklisting).
> 
> Thanks for maintaining & regards,
> 

Are we getting any closer to fixing this problem ? If not, I'll have to start
reverting patches or even declare the driver as BROKEN.

Thanks,
Guenter
