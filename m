Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44362 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732699AbeHNQbL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Aug 2018 12:31:11 -0400
Date: Tue, 14 Aug 2018 06:43:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: michael.hennerich@analog.com
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        corbet@lwn.net, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: hwmon: pmbus: ltc2978: Add support for LTM4686
 uModule
Message-ID: <20180814134355.GA15658@roeck-us.net>
References: <1534249108-29765-1-git-send-email-michael.hennerich@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1534249108-29765-1-git-send-email-michael.hennerich@analog.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Aug 14, 2018 at 02:18:28PM +0200, michael.hennerich@analog.com wrote:
> From: Michael Hennerich <michael.hennerich@analog.com>
> 
> This patch adds support for LTM4686 Ultrathin Dual 10A or
> Single 20A uModule Regulator with Digital Power System Management.
> 
> Datasheet: http://www.analog.com/ltm4686
> 
> 
> Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>

Applied to hwmon-next.

Thanks,
Guenter
