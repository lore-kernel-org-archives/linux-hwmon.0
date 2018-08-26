Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42192 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbeHZR22 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 26 Aug 2018 13:28:28 -0400
Received: by mail-pg1-f193.google.com with SMTP id y4-v6so6222580pgp.9
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Aug 2018 06:45:51 -0700 (PDT)
Date: Sun, 26 Aug 2018 06:45:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
Subject: Re: [PATCH 1/2] hwmon: (mc13783-adc) Remove the mention to 'Atlas'
Message-ID: <20180826134549.GA4364@roeck-us.net>
References: <1535167676-27013-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1535167676-27013-1-git-send-email-festevam@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Aug 25, 2018 at 12:27:55AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> 'Atlas' was an internal name for the MC13783 PMIC only and does not
> apply to MC13892.
> 
> To avoid confusion, remove the 'Atlas' term from the description.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Applied to hwmon-next.

Thanks,
Guenter
