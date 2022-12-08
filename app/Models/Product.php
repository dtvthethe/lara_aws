<?php

namespace App\Models;

use App\Http\Utility\FileUtility;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'detail', 'image'
    ];

    /**
     * Get img path.
     *
     * @return string
     */
    public function imgPath()
    {
        return FileUtility::getObjectURLFromS3($this->image);
    }
}
