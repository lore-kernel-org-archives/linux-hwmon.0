Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:47066 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751323AbdLEQSB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Dec 2017 11:18:01 -0500
Date: Tue, 5 Dec 2017 08:17:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jean Delvare <jdelvare@suse.com>, Lei YU <mine260309@gmail.com>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83773g) Fix a precedence bug in get_fault()
Message-ID: <20171205161759.GB12347@roeck-us.net>
References: <20171205143726.d3tziwhjboyfxmgi@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171205143726.d3tziwhjboyfxmgi@mwanda>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Dec 05, 2017 at 05:37:26PM +0300, Dan Carpenter wrote:
> Shift has higher precedence than mask but presumably we wanted to set
> *val to 1 if BIT(2) was set or 0 if the bit was clear.
> 
> Fixes: de0a524e3e09 ("hwmon: Add W83773G driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Hi Dan,

I already queued up the fix after my own builders reported the problem.

Thanks,
Guenter
