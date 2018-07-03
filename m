Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:46635 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932392AbeGCQNt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Jul 2018 12:13:49 -0400
Date: Tue, 3 Jul 2018 09:13:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: hwmon: Mark expected switch fall-throughs
Message-ID: <20180703161348.GA17749@roeck-us.net>
References: <20180702213017.GA27242@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180702213017.GA27242@embeddedor.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Jul 02, 2018 at 04:30:17PM -0500, Gustavo A. R. Silva wrote:
> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
> where we are expecting to fall through.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Applied to hwmon-next.

Thanks,
Guenter
