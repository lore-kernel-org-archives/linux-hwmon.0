Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33928 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbeIUTKD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Sep 2018 15:10:03 -0400
Date: Fri, 21 Sep 2018 06:21:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: pwm-fan: Silence error on probe deferral
Message-ID: <20180921132111.GA16424@roeck-us.net>
References: <20180921101048.11679-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180921101048.11679-1-thierry.reding@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Sep 21, 2018 at 12:10:47PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Probe deferrals aren't actual errors, so silence the error message in
> case the PWM cannot yet be acquired.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Applied.

Thanks,
Guenter
